part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState{}

final class WeatherLoaded extends WeatherState{

  final WeatherReportModel weatherReport;
  final LocationAddressModel locationAddressModel;

  WeatherLoaded({required this.weatherReport, required this.locationAddressModel});

}

final class WeatherError extends WeatherState{

  final String errorMessage;

   WeatherError(this.errorMessage);

    @override
  String toString() {
    return 'WeatherError(errorMessage: $errorMessage)';
  }

}



