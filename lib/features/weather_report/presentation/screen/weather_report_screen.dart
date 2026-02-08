import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class WeatherReportScreen extends StatefulWidget {
  const WeatherReportScreen({super.key});

  @override
  State<WeatherReportScreen> createState() => _WeatherReportScreenState();
}

class _WeatherReportScreenState extends State<WeatherReportScreen> {
  @override
  void initState() {
    super.initState();

    context.read<WeatherBloc>().add(FetchWeatherReport());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background,
      appBar: AppBar(title: Text("Weather Report Screen"), backgroundColor: AppTheme.of(context).primary,),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is WeatherLoaded) {
            return Center(
              child: Text(state.weatherReport.elevation.toString()),
            );
          }

          if(state is WeatherError){

            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 20,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.downhill_skiing),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<WeatherBloc>().add(FetchWeatherReport());
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
