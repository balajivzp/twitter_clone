import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeModeType { system, light, dark }

final themeModeProvider = StateProvider<ThemeModeType>((ref) {
  return ThemeModeType.system;
});

final currentThemeModeProvider = Provider<ThemeMode>((ref) {
  final themeModeType = ref.watch(themeModeProvider);

  switch (themeModeType) {
    case ThemeModeType.light:
      return ThemeMode.light;
    case ThemeModeType.dark:
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
});
