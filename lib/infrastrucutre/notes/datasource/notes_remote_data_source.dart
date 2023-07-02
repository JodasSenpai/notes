import 'package:injectable/injectable.dart';
import 'package:notes/infrastrucutre/core/firestore_backend_api.dart';
import 'package:notes/infrastrucutre/notes/model/notes_dto.dart';

abstract class INotesRemoteDataSource {
  Future<void> addNote(
      {required String user, required Map<String, dynamic> data});

  Future<List<NoteDto>> getAllNotes();
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

  @override
  Future<List<NoteDto>> getAllNotes() async {
    final response = await firestoreBackendApi.getAllNotes();
    return response.map((e) => NoteDto.fromJson(e)).toList();
  }
}
