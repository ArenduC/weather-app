import 'package:flutter/material.dart';

class WeatherMapView extends StatefulWidget {
  const WeatherMapView({super.key});

  @override
  State<WeatherMapView> createState() => _WeatherMapViewState();
}

class _WeatherMapViewState extends State<WeatherMapView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(child: Text("Map View"),),);
  }
}