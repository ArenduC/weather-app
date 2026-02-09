import 'package:flutter/material.dart';

class WeatherMapScreen extends StatefulWidget {
  const WeatherMapScreen({super.key});

  @override
  State<WeatherMapScreen> createState() => _WeatherMapScreenState();
}

class _WeatherMapScreenState extends State<WeatherMapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(child: Text("Map Screen"),),);
  }
}