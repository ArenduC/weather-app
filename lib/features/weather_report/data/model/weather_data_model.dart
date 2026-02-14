

import 'package:hive/hive.dart';
import 'package:weather_app/core/storage/hive_type_ids.dart';
import 'package:weather_app/features/weather_report/domain/entities/weather_report_enitie.dart';
part 'weather_data_model.g.dart';

@HiveType(typeId: HiveTypeIds.weatherDataModel)
class WeatherDataModel extends WeatherReportEntities {

  


     const WeatherDataModel({required super.weatherTime, required super.weatherTemperature, required super.weatherRelativeHumidity, required super.weatherIsDay, required super.weatherPrecipitation});

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