import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/localization/localization_state.dart';

class LocaleNotifier extends StateNotifier<LocaleState> {
  LocaleNotifier() : super(const LocaleState());

  Future<void> initLocale(BuildContext context) async {
    setLocale(context.locale, context);
  }

  void setLocale(Locale locale, BuildContext context) {
    final locale = state.locale;
    if (locale.languageCode == "sl") {
      context.setLocale(Locale("en"));
      state = state.copyWith(locale: Locale("en"));
    } else {
      context.setLocale(Locale("sl"));
      state = state.copyWith(locale: Locale("sl"));
    }
  }
}

final localeProvider =
    StateNotifierProvider.autoDispose<LocaleNotifier, LocaleState>(
        (ref) => LocaleNotifier());
