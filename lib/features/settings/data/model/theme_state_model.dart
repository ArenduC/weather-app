import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

enum ThemeState {
  light,
  dark,
}

extension ThemeStateX on ThemeState {
  AppThemeToken get tokens {
    switch (this) {
      case ThemeState.dark:
        return darkThemeTokens;
      case ThemeState.light:
        return lightThemeTokens;
    }
  }
}