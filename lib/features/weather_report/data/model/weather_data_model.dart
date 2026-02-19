import 'package:hive/hive.dart';
import 'package:weather_app/core/storage/hive_type_ids.dart';
import 'package:weather_app/features/weather_report/domain/entities/weather_report_entities.dart';

@HiveType(typeId: HiveTypeIds.weatherDataModel)
class WeatherDataModel extends WeatherReportEntities {
  const WeatherDataModel({
    required super.weatherTime,
    required super.weatherTemperature,
    required super.weatherRelativeHumidity,
    required super.weatherIsDay,
    required super.weatherPrecipitation,
    required super.weatherApparentTemperature,
    required super.weatherWindDirection,
    required super.weatherWindGusts,
    required super.weatherWindPressureMsl,
    required super.weatherWindSpeed,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      weatherTime: json["time"],
      weatherTemperature: json["temperature_2m"],
      weatherRelativeHumidity: json["relative_humidity_2m"],
      weatherIsDay: json["is_day"],
      weatherPrecipitation: json["precipitation"],
      weatherApparentTemperature: json["apparent_temperature"],
      weatherWindDirection: json["wind_direction_10m"],
      weatherWindGusts: json["wind_gusts_10m"],
      weatherWindPressureMsl: json["pressure_msl"],
      weatherWindSpeed: json["wind_speed_10m"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weatherTime': weatherTime,
      'weatherTemperature': weatherTemperature,
      'weatherRelativeHumidity': weatherRelativeHumidity,
      'weatherIsDay': weatherIsDay,
      'weatherPrecipitation': weatherPrecipitation,
      'weatherApparentTemperature': weatherApparentTemperature,
      'weatherWindDirection': weatherWindDirection,
      'weatherWindGusts': weatherWindGusts,
      'weatherWindPressureMsl': weatherWindPressureMsl,
      'weatherWindSpeed': weatherWindSpeed,
    };
  }
}
