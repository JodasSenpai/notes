import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/application/auth/onboarding/onboarding_notifier_provider.dart';
import 'package:notes/translations/locale_keys.g.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var onboarding = ref.watch(onboardingNotifierProvider);
    return FlutterLogin(
      title: LocaleKeys.notes.tr(),
      onSubmitAnimationCompleted: () {},
      onLogin: ((loginData) async {
        /*ref.read(onboardingNotifierProvider.notifier).setEmail(loginData.name);
        ref
            .read(onboardingNotifierProvider.notifier)
            .setPassword(loginData.password);*/
        final result = await ref
            .read(onboardingNotifierProvider.notifier)
            .loginWithEmailAndPassword();
        return result;
      }),
      onSignup: (registerData) {
        ref
            .read(onboardingNotifierProvider.notifier)
            .registerWithEmailAndPassword();
      },
      userValidator: (value) {
        final validation =
            ref.read(onboardingNotifierProvider.notifier).setEmail(value!);
        return validation;
      },
      passwordValidator: ((value) {
        final validation =
            ref.read(onboardingNotifierProvider.notifier).setPassword(value!);
        return validation;
      }),
      onRecoverPassword: (string) {},
      hideForgotPasswordButton: true,
      termsOfService: [],
      messages: LoginMessages(
          loginButton: LocaleKeys.login.tr(),
          signupButton: LocaleKeys.registration.tr(),
          passwordHint: LocaleKeys.password.tr(),
          confirmPasswordHint: LocaleKeys.confirm_password.tr()),
    );
  }
}
