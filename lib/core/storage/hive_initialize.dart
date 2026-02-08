import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/features/weather_report/data/model/weather_data_model.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';
import 'package:weather_app/features/weather_report/data/model/weather_units_model.dart';

class HiveInitialize {
  HiveInitialize();

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(WeatherDataModelAdapter());
    Hive.registerAdapter(WeatherReportModelAdapter());
    Hive.registerAdapter(WeatherUnitsModelAdapter());

    await Hive.openBox<WeatherReportModel>('weatherBox');
  }
}
