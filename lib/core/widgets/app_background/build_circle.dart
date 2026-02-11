

import 'package:flutter/material.dart';

Widget buildCircle({
    required Color color,
    required double size,
  }){


  return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withValues(alpha: 220),
            color.withValues(alpha: 0),
          ],
        ),
      ),
    );

}