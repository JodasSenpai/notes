import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier.dart';
import 'package:notes/application/auth/onboarding/onboarding_state.dart';
import 'package:notes/domain/auth/auth_repository.dart';
import 'package:notes/domain/auth/value_objects.dart';
import 'package:oxidized/oxidized.dart';


class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier({required this.authRepositroy, required this.authNotifier})
      : super(OnboardingState.initial()) {
    //devLogin();
  }

  final IAuthRepositroy authRepositroy;
  final AuthNotifier authNotifier;



  void setEmail(String email) {
    state = state.copyWith(email: EmailAddress(email));
  }

  void setPassword(String password) {
    state = state.copyWith(password: Password(password));
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

  void loginWithEmailAndPassword() {
    final response = authRepositroy.loginUserWithEmailAndPassword(
        email: state.email, password: state.password);
    response.when(
        ok: (user) => authNotifier.authenticate(user),
        err: (failure) => print(failure.maybeWhen(
            orElse: () => {print("error")},
            serverError: (message) => print(failure))));
  }
}
