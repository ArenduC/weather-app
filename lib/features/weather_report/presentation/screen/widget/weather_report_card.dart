import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/app_theme_extension.dart';

import 'package:weather_app/features/weather_report/domain/entities/weather_report_entities.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class WeatherReportCard<T> extends StatelessWidget {
  


  final WeatherReportEntities? entities;
   final T Function(WeatherReportEntities) valueSelector;
  
  final String cardTitle;
  final String? unit;
  final Color iconsColor;
  final Icon icon;

  const WeatherReportCard({
    super.key,
   
    this.cardTitle = "Card Title",
    required this.iconsColor,
    required this.icon, 
   
    this.entities, required this.valueSelector,
    this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final value = valueSelector(entities!);
    return Expanded(
      child: GlassCard(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassCard(
              borderRadius: 12,
              padding: const EdgeInsets.all(5.0),

              widget: icon
            ),
            Text(
              cardTitle,
              style: context.textStyle.labelMedium!.copyWith(
                color: context.theme.cardLabel,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value.toString(),
                  style: context.textStyle.displayMedium!.copyWith(
                    color: context.theme.cardValue,
                  ),
                ),

                SizedBox(width: 4),
                Text(
                   unit.toString(),
                  style: context.textStyle.labelMedium!.copyWith(
                    color: context.theme.cardLabel,
                  ),
                ),
              ],
            ),
            Stack(
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
            ),
          ],
        ),
      ),
    );
  }
}
