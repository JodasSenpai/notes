import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/notes/add_note/add_note_state.dart';
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/domain/notes/note/note.dart';
import 'package:notes/domain/notes/notes_repository.dart';
import 'package:oxidized/oxidized.dart';

class AddNoteNotifier extends StateNotifier<AddNoteState> {
  AddNoteNotifier({
    required this.notesRepository,
    required this.user,
    required StringSingleLine lang,
    required StringSingleLine username,
  }) : super(AddNoteState.initial(
          lang: lang,
          username: username,
        ));
  final INotesRepository notesRepository;
  final User user;

  void setUsername(String username) {
    state = state.copyWith(username: StringSingleLine(username));
  }

  void setLang(String lang) {
    state = state.copyWith(lang: StringSingleLine(lang));
  }

  void setNoteValue(String value) {
    state = state.copyWith(noteValue: StringMultiLine(value));
  }

  void addNote() {
    Note note = Note(
        username: state.username,
        noteValue: state.noteValue,
        lang: state.lang,
        createTime: Date(DateTime.now()));
    this.notesRepository.addNote(note, user).when(ok: (_) {
      print("note added");
    }, err: (failure) {
      print(failure);
    });
  }
}
