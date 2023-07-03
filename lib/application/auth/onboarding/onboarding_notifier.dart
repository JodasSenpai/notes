import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier.dart';
import 'package:notes/application/auth/onboarding/onboarding_state.dart';
import 'package:notes/domain/auth/auth_repository.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:oxidized/oxidized.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier({required this.authRepositroy, required this.authNotifier})
      : super(OnboardingState.initial()) {}

  final IAuthRepositroy authRepositroy;
  final AuthNotifier authNotifier;

  String? setEmail(String email) {
    state = state.copyWith(email: EmailAddress(email));
    if (state.email.isValid()) {
      return null;
    } else {
      return "Bad email";
    }
  }

  String? setPassword(String password) {
    state = state.copyWith(password: Password(password));
    if (state.password.isValid()) {
      return null;
    } else {
      return "Bad password";
    }
  }

  void registerWithGoogle() {
    final response = authRepositroy.registerUserWithGoogle();

    response.when(
        ok: (user) => authNotifier.authenticate(user),
        err: (failure) => print(failure.maybeWhen(
            orElse: () => {print("error")},
            serverError: (message) => print(failure))));
  }

  void registerWithEmailAndPassword() {
    final response = authRepositroy.registerUserWithEmailAndPassword(
        email: state.email, password: state.password);
    response.when(
        ok: (user) => authNotifier.authenticate(user),
        err: (failure) => print(failure.maybeWhen(
            orElse: () => {print("error")},
            serverError: (message) => print(failure))));
  }

  Future<String?> loginWithEmailAndPassword() async {
    final response = await authRepositroy.loginUserWithEmailAndPassword(
        email: state.email, password: state.password);
    return response.when(ok: (user) {
      authNotifier.authenticate(user);
      return null;
    }, err: (failure) {
      return failure.maybeMap(
          orElse: () => "error", serverError: (message) => failure.toString());
    });
  }
}
