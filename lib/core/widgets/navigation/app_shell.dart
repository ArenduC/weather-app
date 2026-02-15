import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/app_theme_extension.dart';
import 'package:weather_app/core/widgets/app_background/app_background_widget.dart';
import 'package:weather_app/features/settings/presentation/screen/settings_root_screen.dart';
import 'package:weather_app/features/weather_report/presentation/screen/weather_report_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final PageController _pageController;
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _pages = [const WeatherReportScreen(), const SettingsRootScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:false,
      body: AppBackgroundWidget(
        widget: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: context.theme.primaryBackground,
        selectedIndex: _selectedIndex,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(color: context.theme.primary, fontSize: 14),
        ),
        indicatorColor: context.theme.primary.withValues(alpha: .15),

        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);

          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },

        destinations: [
          NavigationDestination(
            icon: Icon(Icons.cloud, color: context.theme.cardValue),
            label: "Weather",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_rounded, color: context.theme.cardValue),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
