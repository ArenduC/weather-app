
import 'package:flutter/material.dart';
import 'package:weather_app/core/network/api_endpoints.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/core/network/helper/dio_error_handler.dart';
import 'package:weather_app/features/weather_report/data/datasources/weather_local_datasources.dart';
import 'package:weather_app/features/weather_report/data/model/location_data_model.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';


class WeatherDatasources {

  final DioClient dio;
  final WeatherLocalDatasources weatherLocalDatasources;
  

  WeatherDatasources({required this.dio, required this.weatherLocalDatasources});


   
   Future <WeatherReportModel> fetchWeatherReport(LocationDataModel location) async {

      debugPrint("LocationDataSource $location");

      try {
        
        
        final response = await dio.dio.get(ApiEndpoints.currentWeatherReport,   queryParameters: {
    "latitude": location.latitude,
    "longitude": location.latitude,
    "current":
        "temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,weather_code,cloud_cover,pressure_msl,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m",
  },);

         await weatherLocalDatasources.catchWeatherData(response.data);
        return  WeatherReportModel.fromJson(response.data) ;
      } catch (e) {
        throw DioErrorHandler.handle(e);
      }

   }




}