

import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';

abstract class WeatherRepository {

  Future<WeatherReportModel> getWeatherReport();

}