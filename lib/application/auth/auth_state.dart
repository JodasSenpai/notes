import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/auth/user/user.dart';


part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authenticated(User user) = Authenticated;

  const factory AuthState.unauthenticated() = Unauthenticated;
}
