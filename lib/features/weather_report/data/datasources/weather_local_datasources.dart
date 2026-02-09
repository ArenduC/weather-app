import 'package:hive/hive.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';

class WeatherLocalDatasources {
  final Box box;

  WeatherLocalDatasources(this.box);

  Future<void> catchWeatherData(dynamic model) async {
    await box.put("current", model);
  }

   Future<WeatherReportModel?> getWeather() async{
    final data = await box.get("current");
    if(data== null){
      return null;
    }
    return WeatherReportModel.fromJson(data);
  }
}
