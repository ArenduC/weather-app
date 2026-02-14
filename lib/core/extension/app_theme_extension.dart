

import 'package:flutter/material.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

extension AppThemeExtension on BuildContext{
   AppThemeToken get theme => AppTheme.of(this);
    TextTheme get textStyle => AppTypography.textTheme;
}