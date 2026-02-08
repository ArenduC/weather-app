

import 'package:hive/hive.dart';
import 'package:weather_app/core/storage/hive_type_ids.dart';
part 'weather_data_model.g.dart';

@HiveType(typeId: HiveTypeIds.weatherDataModel)
class WeatherDataModel {

  

     @HiveField(0)
     final String weatherTime;
     @HiveField(1)
     final double weatherTemperature;
     @HiveField(2)
     final int weatherRelativeHumidity;
     @HiveField(3)
     final int weatherIsDay;
     @HiveField(4)
     final double weatherPrecipitation;

     WeatherDataModel({required this.weatherTime, required this.weatherTemperature, required this.weatherRelativeHumidity, required this.weatherIsDay, required this.weatherPrecipitation});

     factory WeatherDataModel.fromJson(Map<String, dynamic> json){

      return  WeatherDataModel(
        weatherTime: json["time"], 
        weatherTemperature: json["temperature_2m"], 
        weatherRelativeHumidity: json["relative_humidity_2m"], 
        weatherIsDay: json["is_day"], 
        weatherPrecipitation: json["precipitation"]);
     }
    

    Map<String, dynamic> toJson() {
    return {
      'weatherTime': weatherTime,
      'weatherTemperature': weatherTemperature,
      'weatherRelativeHumidity': weatherRelativeHumidity,
      'weatherIsDay': weatherIsDay,
      'weatherPrecipitation': weatherPrecipitation,
    };
  }

}