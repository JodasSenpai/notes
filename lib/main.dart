import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:notes/application/auth/auth_notifier_provider.dart';
import 'package:notes/localization/localization_notifier.dart';
import 'package:notes/presentation/core/router.dart';
import 'package:notes/presentation/core/router.gr.dart';
import 'package:notes/presentation/core/theme.dart';
import 'package:notes/translations/codegen_loader.g.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/injection_container.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies(Environment.dev);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
      child: EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('sl')],
          path: "assets/translations",
          fallbackLocale: const Locale('en'),
          assetLoader: const CodegenLoader(),
          child: NotesApp())));
}

class NotesApp extends ConsumerWidget {
  final _appRouter = AppRouter();

  NotesApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    final _locale = ref.watch(localeProvider);
    return MaterialApp.router(
      title: "T Notes",
      routerDelegate: AutoRouterDelegate.declarative(_appRouter, routes: (_) {
        return auth.when(
            authenticated: (user) => [MainRouter()],
            unauthenticated: () => [AuthRouter()]);
      }),
      theme: lightTheme,
      darkTheme: darkTheme,
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: _locale.locale,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: Builder(builder: (context) {
          return MaxWidthBox(
            maxWidth: 1200,
            child: ResponsiveScaledBox(
                width: ResponsiveValue<double>(context, conditionalValues: [
                  Condition.equals(name: MOBILE, value: 350),
                  Condition.between(start: 800, end: 1100, value: 500),
                  Condition.between(start: 1000, end: 1200, value: 700),
                  // There are no conditions for width over 1200
                  // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                ]).value,
                child: child!),
          );
        }),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
