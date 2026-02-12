import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/app_background/build_circle.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class AppBackgroundWidget extends StatelessWidget {
  final Widget widget;
  const AppBackgroundWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context){
    final theme = AppTheme.of(context);
    return Stack(
      children: [
       
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.gradientStart,
                  theme.gradientEnd,
                ],
              ),
            ),
          ),

        
          Positioned(
            top: -120,
            left: -80,
            child: buildCircle(
              color: theme.primaryAccent,
              size: 300,
            ),
          ),

           Positioned(
            top: 100,
            left: 100,
            child: buildCircle(
              color: theme.primaryAccent,
              size: 300,
            ),
          ),

          Positioned(
            bottom: -150,
            right: -100,
            child: buildCircle(
              color: theme.weatherHighlight,
              size: 350,
            ),
          ),

         
           BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 80,
              sigmaY: 80,
            ),
            child: Container(color: const Color.fromARGB(0, 0, 0, 0)),
          ),

          widget
      ],
    );
  }
}