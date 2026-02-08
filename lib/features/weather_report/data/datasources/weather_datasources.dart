
import 'package:weather_app/core/network/api_endpoints.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';


class WeatherDatasources {

  final DioClient dio;

  WeatherDatasources({required this.dio});


   
   Future <WeatherReportModel> fetchWeatherReport() async {

      try {
        final response = await dio.dio.get(ApiEndpoints.currentWeatherReport,   queryParameters: {
    "latitude": 22.654945810996125,
    "longitude": 88.38228787896718,
    "current":
        "temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,weather_code,cloud_cover,pressure_msl,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m",
  },);

       
        return  WeatherReportModel.fromJson(response.data) ;
      } catch (e) {
        throw e.toString();
      }

   }




}