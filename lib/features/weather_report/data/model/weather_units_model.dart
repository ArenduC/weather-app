
import 'package:hive/hive.dart';
import 'package:weather_app/core/storage/hive_type_ids.dart';

@HiveType(typeId: HiveTypeIds.weatherUnitModel)
class WeatherUnitsModel {
  @HiveField(0)
  final String weatherTime;
  @HiveField(1)
     final String weatherTemperature;
     @HiveField(3)
     final String weatherRelativeHumidity;
     @HiveField(4)
     final String weatherIsDay;
     @HiveField(5)
     final String weatherPrecipitation;
     



  WeatherUnitsModel({required this.weatherTime, required this.weatherTemperature, required this.weatherRelativeHumidity, required this.weatherIsDay, required this.weatherPrecipitation});

  factory WeatherUnitsModel.fromJson(Map<String, dynamic> json) {
    return WeatherUnitsModel(
      weatherTime: json['time'],
      weatherTemperature: json['temperature_2m'],
      weatherRelativeHumidity: json['relative_humidity_2m'],
      weatherIsDay: json['is_day'],
      weatherPrecipitation: json['precipitation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weatherTime': weatherTime,
      'weatherTemperature': weatherTemperature,
      'weatherRelative_humidity': weatherRelativeHumidity,
      'weatherIsDay': weatherIsDay,
      'weatherPrecipitation': weatherPrecipitation,
    };
  }


}