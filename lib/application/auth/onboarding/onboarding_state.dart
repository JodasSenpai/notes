import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes/domain/auth/value_objects.dart';


part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState(
      {required EmailAddress email,
      required Password password}) = _OnboardingState;

  factory OnboardingState.initial() =>
      OnboardingState(email: EmailAddress(""), password: Password(""));
}
