import 'package:weather_app/features/weather_report/data/datasources/weather_datasources.dart';
import 'package:weather_app/features/weather_report/data/datasources/weather_local_datasources.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';
import 'package:weather_app/features/weather_report/domain/repositories/weather_repository.dart';

class WeatherRepoImpl implements WeatherRepository {
  final WeatherDatasources weatherDatasources;
  final WeatherLocalDatasources weatherLocalDatasources;

  WeatherRepoImpl(this.weatherDatasources, this.weatherLocalDatasources);

  @override
  Future<WeatherReportModel> getWeatherReport() async {
    try {
      final data = await weatherDatasources.fetchWeatherReport();


      return data;
    } catch (e) {
      final cached = await weatherLocalDatasources.getWeather();
      if (cached != null) {
        return cached;
      } else {
        throw Exception("No internet & no cached data");
      }
      
    }
  }
}
