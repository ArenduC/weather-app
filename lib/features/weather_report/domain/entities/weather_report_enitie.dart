import 'package:equatable/equatable.dart';

class WeatherReportEntities extends Equatable {
  final String weatherTime;

  final double weatherTemperature;

  final int weatherRelativeHumidity;

  final int weatherIsDay;

  final double weatherPrecipitation;

  final double elevation;

  const WeatherReportEntities({
    this.weatherTime = '',
    this.weatherTemperature = 0,
    this.weatherRelativeHumidity = 0,
    this.weatherIsDay = 0,
    this.weatherPrecipitation = 0.0,
    this.elevation = 0.0,
  });

  @override
  List<Object?> get props => [
    weatherTime,
    weatherTemperature,
    weatherRelativeHumidity,
    weatherIsDay,
    weatherPrecipitation,
    elevation,
  ];
}
