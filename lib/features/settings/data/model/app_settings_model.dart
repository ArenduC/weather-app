import 'package:weather_app/features/settings/data/model/theme_state_model.dart';
import 'package:weather_app/features/settings/data/model/weather_app_time_zone_model.dart';

class AppSettingsModel {
  final ThemeState themeState;
  final bool gpsState;
  final WeatherAppTimeZone weatherAppTimeZone;

  const AppSettingsModel({
    this.themeState = ThemeState.dark,
    this.gpsState = false,
    this.weatherAppTimeZone = WeatherAppTimeZone.ist,
  });

  AppSettingsModel copyWith({
    ThemeState? themeState,
    bool? gpsState,
    WeatherAppTimeZone? weatherAppTimeZone,
  }) {
    return AppSettingsModel(
      themeState: themeState ?? this.themeState,
      gpsState: gpsState?? this.gpsState,
      weatherAppTimeZone: weatherAppTimeZone?? this.weatherAppTimeZone,
    );
  }
}
