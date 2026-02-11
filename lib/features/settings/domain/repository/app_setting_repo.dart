import 'package:weather_app/features/settings/data/model/app_settings_model.dart';
import 'package:weather_app/features/settings/data/model/theme_state_model.dart';

abstract class AppSettingRepo{

  Future<void> setThemeState(ThemeState data );

  Future<AppSettingsModel> getThemeState();

}