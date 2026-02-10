import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_report/data/model/weather_data_model.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class MainWeatherCard extends StatelessWidget {
  final WeatherDataModel? weatherDataModel;
  const MainWeatherCard({super.key, this.weatherDataModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.stretch,

      
      children: [
        Container(
          margin: const EdgeInsets.all(70),
          decoration: BoxDecoration(color: AppTheme.of(context).primaryAccent), child: Text(weatherDataModel!.weatherTime.toString())),
      ],
    );
  }
}