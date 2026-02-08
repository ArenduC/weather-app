

import 'package:hive/hive.dart';
import 'package:weather_app/core/storage/hive_type_ids.dart';
import 'package:weather_app/features/weather_report/data/model/weather_data_model.dart';
import 'package:weather_app/features/weather_report/data/model/weather_units_model.dart';

part 'weather_report_model.g.dart';


@HiveType(typeId: HiveTypeIds.weatherReportModel)
class WeatherReportModel {
  
  @HiveField(0)
  final double elevation;
  @HiveField(1)
  final WeatherDataModel  weatherData;
  @HiveField(2)
  final WeatherUnitsModel weatherUnit;

  WeatherReportModel({required this.elevation, required this.weatherData, required this.weatherUnit});


  factory WeatherReportModel.fromJson(Map<String, dynamic> json){
    return WeatherReportModel(elevation: json["elevation"], weatherData: WeatherDataModel.fromJson(json["current"]) , weatherUnit: WeatherUnitsModel.fromJson(json["current_units"]) );
  }

  Map<String, dynamic> toJson(){

    return {
      "elevation": elevation,
      "weatherData": weatherData,
      "weatherUnit": weatherUnit,
    };
  }

  


  
}