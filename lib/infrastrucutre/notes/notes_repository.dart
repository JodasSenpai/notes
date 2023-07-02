import 'package:injectable/injectable.dart';
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/notes/note/note.dart';
import 'package:notes/domain/notes/notes_failure.dart';
import 'package:notes/domain/notes/notes_repository.dart';
import 'package:notes/infrastrucutre/notes/datasource/notes_remote_data_source.dart';
import 'package:notes/infrastrucutre/notes/model/notes_dto.dart';
import 'package:oxidized/src/result.dart';
import 'package:oxidized/src/unit.dart';

@LazySingleton(as: INotesRepository)
class NotesRepositroy implements INotesRepository {
  final INotesRemoteDataSource notesRemoteDataSource;

  NotesRepositroy({required this.notesRemoteDataSource});

  @override
  Future<Result<Unit, NotesFailure>> addNote(Note note, User user) async {
    try {
      Map<String, dynamic> noteData = {
        "createTime": DateTime.now(),
        "lang": note.lang.getOrCrash(),
        "note": note.noteValue.getOrCrash(),
        "username": note.username.getOrCrash()
      };
      await notesRemoteDataSource.addNote(
          user: user.email.getOrCrash(), data: noteData);
      return Ok(unit);
    } catch (e) {
      return Err(NotesFailure.serverError(e.toString()));
    }
  }

  @override
  Future<Result<List<Note>, NotesFailure>> getAllNotes() async {
    try {
      final response = await notesRemoteDataSource.getAllNotes();
      return Ok(response.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Err(NotesFailure.serverError(e.toString()));
    }
  }
}
