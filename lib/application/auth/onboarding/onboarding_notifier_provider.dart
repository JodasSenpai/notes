import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';
import 'package:notes/application/auth/onboarding/onboarding_notifier.dart';
import 'package:notes/application/auth/onboarding/onboarding_state.dart';
import 'package:notes/core/injection_container.dart';
import 'package:notes/domain/auth/auth_repository.dart';

final onboardingNotifierProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) =>
        OnboardingNotifier(
            authRepository: sl<IAuthRepository>(),
            authNotifier: ref.read(authNotifierProvider.notifier)));
