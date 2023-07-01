import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_state.dart';
import 'package:notes/domain/auth/user/user.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(Unauthenticated());

  void authenticate(User user) async {
    state = Authenticated(user);
  }

  void logOut() {
    state = const Unauthenticated();
  }
}
