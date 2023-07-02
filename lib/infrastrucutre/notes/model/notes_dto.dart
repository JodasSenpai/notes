import 'package:cloud_firestore/cloud_firestore.dart';
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
      required String note,
      required DateTime createTime}) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) => NoteDto(
      lang: json["lang"],
      username: json["username"],
      note: json["note"],
      createTime: json["createTime"].toDate());
}

extension NoteDtoX on NoteDto {
  Note toDomain() {
    return Note(
        id: id != null ? UniqueStringId.fromUniqueString(id!) : null,
        lang: StringSingleLine(lang),
        username: StringSingleLine(username),
        noteValue: StringMultiLine(note),
        createTime: Date(createTime));
  }
}
