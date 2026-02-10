import 'package:flutter/material.dart';

import 'package:weather_app/features/weather_map/presentation/screen/weather_map_screen.dart';

import 'package:weather_app/features/weather_report/presentation/screen/weather_report_screen.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
int _selectedIndex = 0;
late final List<Widget> _pages;


@override
void initState(){
  super.initState();

  _pages =   [
    const WeatherReportScreen(),
    const WeatherMapScreen(),
];
}

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
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