import 'package:flutter/material.dart';

class MonthlyWeatherReport extends StatefulWidget {
  const MonthlyWeatherReport({super.key});

  @override
  State<MonthlyWeatherReport> createState() => _MonthlyWeatherReportState();
}

class _MonthlyWeatherReportState extends State<MonthlyWeatherReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Monthly Weather Report"),),);
  }
}