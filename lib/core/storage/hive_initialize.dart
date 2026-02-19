import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';


class HiveInitialize {
  HiveInitialize();

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<WeatherReportModel>('weatherBox');
  }
}
