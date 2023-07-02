import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/notes/note/note.dart';
import 'package:notes/domain/notes/notes_failure.dart';
import 'package:oxidized/oxidized.dart';

abstract class INotesRepositroy {
  Future<Result<Unit, NotesFailure>> addNote(Note note, User user);

  Stream<Result<List<Note>, NotesFailure>> subscribeToNotes();
}
