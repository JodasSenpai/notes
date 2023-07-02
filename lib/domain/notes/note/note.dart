import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/core/value_objects.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note(
      {UniqueStringId? id,
      required StringSingleLine username,
      required StringMultiLine noteValue,
      required StringSingleLine lang,
      required Date createTime}) = _Note;
}
