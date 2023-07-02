import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/core/value_objects.dart';

part 'add_note_state.freezed.dart';

@freezed
class AddNoteState with _$AddNoteState {
  const factory AddNoteState(
      {required StringSingleLine lang,
      required StringSingleLine username,
      required StringMultiLine noteValue}) = _AddNoteState;

  factory AddNoteState.initial(
          {required StringSingleLine lang,
          required StringSingleLine username}) =>
      AddNoteState(
          lang: lang, username: username, noteValue: StringMultiLine(""));
}
