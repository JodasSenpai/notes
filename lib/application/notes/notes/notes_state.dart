import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/notes/note/note.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = Initial;

  const factory NotesState.loading() = Loading;

  const factory NotesState.loaded(List<Note> notes) = Loaded;

}
