import 'package:hive/hive.dart';
import 'package:weather_app/features/settings/data/model/app_settings_model.dart';
import 'package:weather_app/features/settings/data/model/theme_state_model.dart';
import 'package:weather_app/features/settings/domain/repository/app_setting_repo.dart';

class ThemeStateChangeRepo implements AppSettingRepo {
  final Box box;

  ThemeStateChangeRepo(this.box);

  @override
  Future<void> setThemeState(ThemeState stateValue) async {
    try {
      await box.put("themeState", stateValue.name);
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<AppSettingsModel> getThemeState() async {
    try {
      final state = await box.get("themeState");

      ThemeState theme;

      if(state == null){

        theme = ThemeState.dark;
      } else{

         theme = ThemeState.values.firstWhere((e)=>e.name == state);
      }
     
      return AppSettingsModel(themeState: theme);
    } catch (e) {
      throw (e.toString());
    }
  }
}
