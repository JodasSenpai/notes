import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

const Locale fallbackLocale = Locale("sl");

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState({@Default(fallbackLocale) Locale locale}) =
      _LocaleState;
}
