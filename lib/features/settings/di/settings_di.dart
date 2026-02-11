


import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/features/settings/data/repository/theme_state_change_repo.dart';
import 'package:weather_app/features/settings/domain/repository/app_setting_repo.dart';
import 'package:weather_app/features/settings/presentation/cubit/app_settings_cubit.dart';

final sl = GetIt.instance;

Future<void> registerSettings() async{

 

  //REPO
  sl.registerLazySingleton<AppSettingRepo>(
  () => ThemeStateChangeRepo(
    sl<Box<dynamic>>(instanceName: 'themeBox')
  ),
);

  //CUBIT

  sl.registerLazySingleton<AppSettingsCubit>(()=>(AppSettingsCubit(sl())));


}