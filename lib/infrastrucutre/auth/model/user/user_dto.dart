import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:notes/domain/auth/user/user.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:notes/domain/core/value_objects.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto(
      {required String user_id,
        required String email}) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromFirebaseUser(firebaseAuth.User firebaseUser){
    return UserDto(user_id: firebaseUser.uid, email: firebaseUser.email!);
  }
}

extension UserDtoX on UserDto {
  User toDomain() {
    return User(
        id: UniqueStringId.fromUniqueString(user_id),
        email: EmailAddress(email));
  }
}

