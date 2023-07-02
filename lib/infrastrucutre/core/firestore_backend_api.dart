import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class IFirestoreBackendApi {
  Future<void> addNote({required String user,
    required Map<String, dynamic> data});

  Future<Map<String, dynamic>> subscribeToNotes();
}

@LazySingleton(as: IFirestoreBackendApi)
class FirestoreBackendApi implements IFirestoreBackendApi {
  final FirebaseFirestore firestore;

  FirestoreBackendApi({
    required this.firestore,
  });

  @override
  Future<void> addNote({required String user,
    required Map<String, dynamic> data}) async {
    await firestore.collection(user).add(data);
  }

  @override
  Future<Map<String, dynamic>> subscribeToNotes() {
    // TODO: implement subscribeToNotes
    throw UnimplementedError();
  }
}
