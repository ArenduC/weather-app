import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/navigation/app_shell.dart';
import 'package:weather_app/features/settings/data/model/theme_state_model.dart';
import 'package:weather_app/features/settings/presentation/cubit/app_settings_cubit.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';
import 'package:weather_app/app_bloc_observer.dart';
import 'package:weather_app/core/di/service_locator.dart';
import 'package:weather_app/core/security/weather_app_monitor_service.dart';
import 'package:weather_app/core/storage/hive_initialize.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await HiveInitialize.init();
  await setupLocator();

  

  runApp(
    BlocProvider(
      create: (_) => sl<AppSettingsCubit>()..loadSettings(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    final monitor = sl<WeatherAppMonitorService>();

    monitor.warningStream.listen((warning) {
      if (warning != null) {
        messengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(warning.message),
            duration: Duration(days: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        messengerKey.currentState?.hideCurrentSnackBar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        final themeState = state is AppSettingsLoaded
            ? state.appSettingsModel.themeState
            : ThemeState.dark;

        return AppTheme(
          // ✅ Move here
          tokens: themeState.tokens,
          child: MaterialApp(
            theme: MaterialAppTheme.light(),
            darkTheme: MaterialAppTheme.dark(),
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: messengerKey,
                builder: (context, child) {
      final isDark = themeState == ThemeState.dark;

      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness:
              isDark ? Brightness.dark : Brightness.light,
        ),
        child: child!,
      );
    },


            
            home: const AppShell(),
          ),
        );
      },
    );
  }
}
