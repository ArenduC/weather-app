part of 'app_settings_cubit.dart';

@immutable
sealed class AppSettingsState {}

final class AppSettingsInitial extends AppSettingsState {}
final class AppSettingsLoading extends AppSettingsState {}
final class AppSettingsLoaded extends AppSettingsState{

  final AppSettingsModel appSettingsModel;
  
  AppSettingsLoaded(this.appSettingsModel);
}
final class AppSettingsFailed extends AppSettingsState{}
