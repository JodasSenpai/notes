import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/onboarding/onboarding_notifier_provider.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var onboarding = ref.watch(onboardingNotifierProvider);
    return FlutterLogin(
      title: 'Notes',

      onLogin: ((loginData) {
        ref
            .read(onboardingNotifierProvider.notifier).setEmail(loginData.name);
        ref
            .read(onboardingNotifierProvider.notifier).setPassword(loginData.password);
        ref
            .read(onboardingNotifierProvider.notifier)
            .loginWithEmailAndPassword();
      }),
      onSignup: (registerData) {
        ref
            .read(onboardingNotifierProvider.notifier).setEmail(registerData.name!);
        ref
            .read(onboardingNotifierProvider.notifier).setPassword(registerData.password!);
        ref
            .read(onboardingNotifierProvider.notifier)
            .registerWithEmailAndPassword();
      },
      userValidator: (value) {

        return null;
      },
      passwordValidator: ((value) {

        return null;
      }),
      onRecoverPassword: (string) {},
      hideForgotPasswordButton: true,
      termsOfService: [],
      messages: LoginMessages(
          loginButton: "Prijava",
          signupButton: "Registracija",

          passwordHint: "Geslo",
          confirmPasswordHint: "Potrdi geslo"),
    );
  }
}
