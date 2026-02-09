import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/navigation/screen_config.dart';
import 'package:weather_app/features/weather_map/presentation/screen/weather_map_screen.dart';
import 'package:weather_app/features/weather_report/presentation/screen/weather_report_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final reportConfig = WeatherReportScreen.config(context);
    final mapConfig = WeatherReportScreen.config(context);

    final configs = [reportConfig, mapConfig];
    final currentConfig = configs[_selectedIndex];

    return Scaffold(
      appBar: currentConfig.appBar,
      floatingActionButton: currentConfig.floatingActionButton,
      extendBodyBehindAppBar: currentConfig.extendBodyBehindAppBar,
      body: IndexedStack(
        index: _selectedIndex,
        children: configs.map((e) => e.body).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.cloud), label: "Weather"),
          NavigationDestination(icon: Icon(Icons.map), label: "Map"),
        ],
      ),
    );
  }
}