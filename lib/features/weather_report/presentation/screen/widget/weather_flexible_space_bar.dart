import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class WeatherFlexibleSpaceBar extends StatelessWidget {
  const WeatherFlexibleSpaceBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SliverAppBar(
      expandedHeight: 300,
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double maxHeight = 200;
          final double minHeight = kToolbarHeight;
          final double percent =
              (constraints.maxHeight - minHeight) / (maxHeight - minHeight);

          final isScroll =
              constraints.biggest.height <=
              kToolbarHeight + MediaQuery.of(context).padding.top;

          return Container(
            decoration: BoxDecoration(
              color: isScroll ? theme.primaryBackground : Colors.transparent,
            ),
            child: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 20),
              title: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kolkata",
                      style: AppTypography.textTheme.bodySmall!.copyWith(
                        color: theme.cardValue,
                      ),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Sky (slowest movement)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 50,
                    child: Align(
                      alignment: AlignmentGeometry.topCenter,
                      child: Transform.scale(
                        scale: 0.7 + (0.3 * percent),
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              "Kolkata",
                              style: AppTypography.textTheme.displayMedium!
                                  .copyWith(color: theme.cardValue),
                            ),
                            Text(
                              "India",
                              style: AppTypography.textTheme.bodyMedium!
                                  .copyWith(color: theme.cardValue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 220,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 1.svg',
                        height: 120,
                      ),
                    ),
                  ),

                  // Clouds (medium speed)
                  Positioned(
                    left: 180,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 3.svg',

                        height: 150,
                      ),
                    ),
                  ),

                  // Mountains (fastest movement)
                  Positioned(
                    left: 230,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 4.svg',
                        height: 180,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 5.svg',
                        height: 130,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 6.svg',
                        height: 80,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    bottom: 200,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 7.svg',
                        height: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 8.svg',
                        height: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 130,
                    bottom: 0,
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * percent),
                      alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        'assets/features/weather_report/sliverAsset 9.svg',
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
