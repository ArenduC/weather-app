import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/navigation/app_shell.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';
import 'package:weather_app/app_bloc_observer.dart';
import 'package:weather_app/core/di/service_locator.dart';
import 'package:weather_app/core/security/weather_app_monitor_service.dart';
import 'package:weather_app/core/storage/hive_initialize.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await setupLocator();
  await HiveInitialize.init();
  runApp(WeatherApp());
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
          SnackBar(content: Text(warning.message), duration: Duration(days: 1), behavior: SnackBarBehavior.floating,),
        );
      } else {
        messengerKey.currentState?.hideCurrentSnackBar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      scaffoldMessengerKey: messengerKey,
      home:const AppTheme(tokens: darkThemeTokens, child: AppShell()),
      
    );
  }
}
