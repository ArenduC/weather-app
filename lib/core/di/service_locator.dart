import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/core/network/network_service.dart';
import 'package:weather_app/core/security/weather_app_monitor_service.dart';
import 'package:weather_app/features/settings/di/settings_di.dart';
import 'package:weather_app/features/weather_report/di/weather_report_di.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();

   //APP NETWORK SERVICE

  sl.registerLazySingleton<NetworkService>(() => NetworkService());

  final weatherBox = await Hive.openBox<dynamic>('current');
  final themeStateBox = await Hive.openBox<dynamic>('themeState');

  sl.registerLazySingleton<Box<dynamic>>(
    () => weatherBox,
    instanceName: 'weatherBox',
  );

  sl.registerLazySingleton<Box<dynamic>>(
    () => themeStateBox,
    instanceName: 'themeBox',
  );

  //APP MONITOR SERVICE

  sl.registerLazySingleton(() => WeatherAppMonitorService(sl()));

 

  //APP REMOTE CONNECTION DIOCLIENT
  sl.registerLazySingleton<DioClient>(() => DioClient());

  //FUTURE

  await registerWeatherReport();
  await registerSettings();
}
