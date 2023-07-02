import 'package:injectable/injectable.dart';
import 'package:notes/infrastrucutre/core/firestore_backend_api.dart';

abstract class INotesRemoteDataSource {
  Future<void> addNote(
      {required String user, required Map<String, dynamic> data});
}

@LazySingleton(as: INotesRemoteDataSource)
class NotesRemoteDataSource implements INotesRemoteDataSource {
  final IFirestoreBackendApi firestoreBackendApi;

  NotesRemoteDataSource({required this.firestoreBackendApi});

  @override
  Future<void> addNote(
      {required String user, required Map<String, dynamic> data}) async {
    await firestoreBackendApi.addNote(user: user, data: data);
  }
}
