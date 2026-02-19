import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/app_theme_extension.dart';

class WeatherProgressBar extends StatelessWidget {
  const WeatherProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
              children: [
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: context.theme.location.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                Container(
                  height: 10,
                  width: 50,
                  decoration: BoxDecoration(
                    color: context.theme.location,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            )
         
         ;
  }
}