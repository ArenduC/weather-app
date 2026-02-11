

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/data/model/app_settings_model.dart';
import 'package:weather_app/features/settings/data/model/theme_state_model.dart';
import 'package:weather_app/features/settings/domain/repository/app_setting_repo.dart';

part 'app_settings_state.dart';

class AppSettingsCubit extends Cubit<AppSettingsState>  {

  final AppSettingRepo appSettingRepo; 

  AppSettingsCubit(this.appSettingRepo) : super(AppSettingsInitial());



   /// Only load current settings
  Future<void> loadSettings() async {
    emit(AppSettingsLoading());

    try {
      final state = await appSettingRepo.getThemeState();
      emit(AppSettingsLoaded(state));
    } catch (e) {
      emit(AppSettingsFailed());
    }
  }

  /// Only toggle theme
  Future<void> toggleTheme() async {
    if (state is! AppSettingsLoaded) return;

    final current = (state as AppSettingsLoaded).appSettingsModel;

    final newTheme =
        current.themeState == ThemeState.dark
            ? ThemeState.light
            : ThemeState.dark;

    await appSettingRepo.setThemeState(newTheme);

    emit(AppSettingsLoaded(
      current.copyWith(themeState: newTheme),
    ));
  }
}
