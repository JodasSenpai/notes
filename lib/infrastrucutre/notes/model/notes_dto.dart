import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/core/value_objects.dart';
import 'package:notes/domain/notes/note/note.dart';

part 'notes_dto.freezed.dart';
part 'notes_dto.g.dart';

@freezed
class NoteDto with _$NoteDto {
  const factory NoteDto(
      {String? id,
      required String lang,
      required String username,
      required String noteValue,
      required DateTime createTime}) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);
}

extension NoteDtoX on NoteDto {
  Note toDomain() {
    return Note(
        id: id != null ? UniqueStringId.fromUniqueString(id!) : null,
        lang: StringSingleLine(lang),
        username: StringSingleLine(username),
        noteValue: StringMultiLine(noteValue),
        createTime: Date(createTime));
  }
}
