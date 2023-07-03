import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class IFirestoreBackendApi {
  Future<void> addNote(
      {required String user, required Map<String, dynamic> data});

  Future<List<Map<String, dynamic>>> getAllNotes();
}

@LazySingleton(as: IFirestoreBackendApi)
class FirestoreBackendApi implements IFirestoreBackendApi {
  final FirebaseFirestore firestore;

  FirestoreBackendApi({
    required this.firestore,
  });

  @override
  Future<void> addNote(
      {required String user, required Map<String, dynamic> data}) async {
    final documentRef = firestore.collection("notes").doc(user);
    DocumentSnapshot documentSnapshot = await documentRef.get();
    if (!documentSnapshot.exists) {
      await firestore.collection("notes").doc(user).set({"notesList": []});
    }
    await firestore.collection("notes").doc(user).update({
      "notesList": FieldValue.arrayUnion([data])
    });
  }

  @override
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    final documents = await firestore.collection("notes").get();
    List<Map<String, dynamic>> allNotes = [];
    for (var document in documents.docs) {
      final userNotes = document.data();
      for (var note in userNotes["notesList"]) {
        allNotes.add(note);
      }
    }
    return allNotes;
  }
}
