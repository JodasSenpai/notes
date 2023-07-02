import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/notes/note/note.dart';
import 'package:notes/domain/notes/notes_failure.dart';
import 'package:oxidized/oxidized.dart';

abstract class INotesRepository {
  Future<Result<Unit, NotesFailure>> addNote(Note note, User user);

  Future<Result<List<Note>, NotesFailure>> getAllNotes();
}
