import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/di/service_locator.dart';
import 'package:weather_app/core/widgets/navigation/screen_config.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_report/presentation/screen/weather_report_view.dart';

class WeatherReportScreen {

  static ScreenConfig config(BuildContext context) {
    return ScreenConfig(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body:  BlocProvider(
        create: (_) => WeatherBloc(sl()),
        child: const WeatherReportView(),
      ),
    );
  }
}