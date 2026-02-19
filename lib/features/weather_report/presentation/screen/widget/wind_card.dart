import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/app_theme_extension.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';
import 'package:weather_app/features/weather_report/presentation/screen/widget/weather_report_card.dart';

class WindCard extends StatelessWidget {
  final WeatherReportModel? weatherDataModel;
  const WindCard({super.key, this.weatherDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      alignment: Alignment.center,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,

        children: [
          WeatherReportCard<double>(
            entities: weatherDataModel!.weatherData,
            valueSelector: (e) => e.weatherWindGusts,
            unit: "km/h",
            cardTitle: "Wind Gusts",
            iconsColor: context.theme.cardLabel,
            icon: Icon(Icons.air_rounded, color: context.theme.wind),
          ),
          SizedBox(width: 16),
          WeatherReportCard<double>(
            entities: weatherDataModel!.weatherData,
            valueSelector: (e) => e.weatherWindPressureMsl,
            unit: "hPa",
            iconsColor: context.theme.cardLabel,
            icon: Icon(Icons.layers_rounded, color: context.theme.wind),
            cardTitle: "Wind Pressure",
          ),
        ],
      ),
    );
  }
}
