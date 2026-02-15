import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/features/weather_report/data/datasources/location_address_datasource.dart';
import 'package:weather_app/features/weather_report/data/datasources/location_datasources.dart';
import 'package:weather_app/features/weather_report/data/datasources/weather_datasources.dart';
import 'package:weather_app/features/weather_report/data/datasources/weather_local_datasources.dart';
import 'package:weather_app/features/weather_report/data/model/location_data_model.dart';

import 'package:weather_app/features/weather_report/data/repository/location_repo_impl.dart';
import 'package:weather_app/features/weather_report/data/repository/weather_repo_impl.dart';
import 'package:weather_app/features/weather_report/domain/repositories/location_repository.dart';
import 'package:weather_app/features/weather_report/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> registerWeatherReport() async {
  //DATASOURCE;
  sl.registerLazySingleton<WeatherDatasources>(
    () => WeatherDatasources(dio: DioClient(), weatherLocalDatasources: sl()),
  );

  sl.registerLazySingleton<WeatherLocalDatasources>(
    () => WeatherLocalDatasources(sl<Box<dynamic>>(instanceName: 'weatherBox')),
  );

  sl.registerLazySingleton<LocationDatasources>(() => LocationDatasources());

  sl.registerLazySingleton<LocationAddressDatasource>(()=> LocationAddressDatasource());

  //REPOSITORIES;

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepoImpl(sl(), sl()),
  );
  sl.registerLazySingleton<LocationRepository>(
    () => LocationRepoImpl(sl(), LocationDataModel(latitude: 0.0, longitude: 0.0), sl()),
  );

  //BLOC

  sl.registerLazySingleton<WeatherBloc>(() => WeatherBloc(sl(), sl()));
}
