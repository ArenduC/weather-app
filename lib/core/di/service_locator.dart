

import 'package:get_it/get_it.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/core/network/network_service.dart';
import 'package:weather_app/core/security/weather_app_monitor_service.dart';
import 'package:weather_app/features/weather_report/di/weather_report_di.dart';

final sl = GetIt.instance;


Future<void> setupLocator() async{


  //APP MONITOR SERVICE

  sl.registerLazySingleton(()=> WeatherAppMonitorService(sl()));

  //APP NETWORK SERVICE

  sl.registerLazySingleton<NetworkService>(()=> NetworkService());


  //APP REMOTE CONNECTION DIOCLIENT
  sl.registerLazySingleton<DioClient>(()=> DioClient());



  //FUTURE

  registerWeatherReport();


}