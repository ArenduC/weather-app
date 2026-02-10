import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_report/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather_report/presentation/screen/widget/main_weather_card.dart';
import 'package:weather_app_ui_kit/weather_app_ui_kit.dart';

class WeatherReportView extends StatefulWidget {
  const WeatherReportView({super.key});

  @override
  State<WeatherReportView> createState() => _WeatherReportViewState();
}

class _WeatherReportViewState extends State<WeatherReportView> {

   @override
  void initState() {
    super.initState();

    context.read<WeatherBloc>().add(FetchWeatherReport());
  }
  @override
  Widget build(BuildContext context) {
    return 
   SafeArea(
     child: CustomScrollView(
       slivers: <Widget>[ 
        SliverAppBar(
          backgroundColor: AppTheme.of(context).primaryBackground,
          expandedHeight: 200,
           flexibleSpace: const FlexibleSpaceBar(
                title: Text('SliverAppBar'),
                background: FlutterLogo(),
              ),
          
        ),
         BlocBuilder<WeatherBloc, WeatherState>(
           
            builder: (context, state) {
              if (state is WeatherLoading) {
                return SliverFillRemaining(child: const Center(child: CircularProgressIndicator()));
              }
       
              if (state is WeatherLoaded) {
                return SliverToBoxAdapter(
                  child: Column(children: [
                  
                    MainWeatherCard(weatherDataModel: state.weatherReport.weatherData,)
                  
                  ],),
                );
              }
       
              if (state is WeatherError) {
                return SliverFillRemaining(child: Center(child: Text(state.errorMessage)));
              }
              return SliverFillRemaining(child: const SizedBox());
            },
          ),
       
  ]),
   );
    
    
  
  
  }
}