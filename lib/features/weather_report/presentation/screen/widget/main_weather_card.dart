import 'package:flutter/material.dart';
import 'package:weather_app/features/weather_report/data/model/weather_data_model.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class MainWeatherCard extends StatelessWidget {
  final WeatherDataModel? weatherDataModel;
  const MainWeatherCard({super.key, this.weatherDataModel});

  @override
  Widget build(BuildContext context) {
    //Use ui kit for theme
    final theme = AppTheme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),

          child: GlassCard(
            widget: Text(
              weatherDataModel!.weatherTime.toString(),
              style: AppTypography.textTheme.displayLarge!.copyWith(
                color: theme.cardValue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
