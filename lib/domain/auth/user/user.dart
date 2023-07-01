
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:notes/domain/core/value_objects.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User(
      {required UniqueStringId id,
        required EmailAddress email}) = _User;
}
