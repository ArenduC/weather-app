import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/features/weather_report/data/datasources/weather_datasources.dart';
import 'package:weather_app/features/weather_report/data/datasources/weather_local_datasources.dart';
import 'package:weather_app/features/weather_report/data/repository/weather_repo_impl.dart';
import 'package:weather_app/features/weather_report/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> registerWeatherReport() async {
  await Hive.initFlutter();

  final weatherBox = await Hive.openBox<dynamic>('current');

  //HIVE MODEL
  sl.registerLazySingleton<Box<dynamic>>(() => weatherBox);

  //DATASOURCE;
  sl.registerLazySingleton<WeatherDatasources>(
    () => WeatherDatasources(dio: DioClient(),weatherLocalDatasources: sl() ),
  );
  sl.registerLazySingleton<WeatherLocalDatasources>(
    () => WeatherLocalDatasources(sl()),
  );

  //REPOSITORIES;

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepoImpl(sl(), sl()),
  );

  //BLOC

  sl.registerLazySingleton<WeatherBloc>(() => WeatherBloc(sl()));
}
