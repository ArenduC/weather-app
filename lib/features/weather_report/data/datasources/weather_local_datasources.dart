import 'package:hive/hive.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';

class WeatherLocalDatasources {
  final Box<WeatherReportModel> box;

  WeatherLocalDatasources(this.box);

  Future<void> catchWeatherData(WeatherReportModel model) async {
    await box.put("current", model);
  }

  WeatherReportModel? getWeather() {
    return box.get('current');
  }
}
