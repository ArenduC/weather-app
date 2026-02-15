import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/service_locator.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_report/presentation/screen/weather_report_view.dart';

class WeatherReportScreen extends StatelessWidget {
  const WeatherReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=> WeatherBloc(sl(), sl()), child: const WeatherReportView(),);
  }
}