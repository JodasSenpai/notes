import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/notes/notes/notes_state.dart';
import 'package:notes/domain/notes/notes_repository.dart';
import 'package:oxidized/oxidized.dart';

class NotesNotifier extends StateNotifier<NotesState> {
  NotesNotifier({required this.notesRepository}) : super(Initial());
  final INotesRepository notesRepository;

  void getNotes() {
    state = Loading();
    notesRepository.getAllNotes().when(ok: (notes) {
      state = Loaded(notes);
    }, err: (failure) {
      print(failure);
    });
  }
}
