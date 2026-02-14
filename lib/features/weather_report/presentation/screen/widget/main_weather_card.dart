import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/app_theme_extension.dart';
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
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          alignment: Alignment.center,
          
          child: GlassCard(
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GlassCard(
                      color: context.theme.weatherHighlight.withOpacity(.1),
                      borderRadius: 12,
                      widget: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Icon(Icons.device_thermostat, color: context.theme.weatherHighlight, size: 50,),
                      )),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Clear Sky", style: AppTypography.textTheme.labelLarge!.copyWith(color: context.theme.cardLabel),),
                          Text(
                            "20"
                            "°C",
                            style: AppTypography.textTheme.displayLarge!
                                .copyWith(color: context.theme.cardValue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  
  
  }
}
