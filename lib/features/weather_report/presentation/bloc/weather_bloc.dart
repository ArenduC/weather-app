import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather_report/data/model/weather_report_model.dart';
import 'package:weather_app/features/weather_report/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeatherReport>((_getCurrentWeatherReport));
  }

  @override
  void onChange(Change<WeatherState> change) {
    super.onChange(change);

    debugPrint("change$change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint("error$error");
  }

  void _getCurrentWeatherReport(
    FetchWeatherReport event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());

    try {
      final weatherReport = await weatherRepository.getWeatherReport();
      emit(WeatherLoaded(weatherReport: weatherReport));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
