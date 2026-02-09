import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';

class WeatherReportView extends StatefulWidget {
  const WeatherReportView({super.key});

  @override
  State<WeatherReportView> createState() => _WeatherReportViewState();
}

class _WeatherReportViewState extends State<WeatherReportView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<WeatherBloc, WeatherState>(
       
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WeatherLoaded) {
            return Center(
              child: Text(state.weatherReport.elevation.toString()),
            );
          }

          if (state is WeatherError) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox();
        },
      ),
    
    );
  
  
  }
}