import 'package:equatable/equatable.dart';

class WeatherReportEntities extends Equatable {
  // Current weather API response key and its models key name

  final String weatherTime; // "time": "2026-02-18T12:45",

  final double weatherTemperature; // "temperature_2m": 25.1,

  final int weatherRelativeHumidity; // "relative_humidity_2m": 54,

  final double weatherApparentTemperature; // "apparent_temperature": 26.6,

  final int weatherIsDay; //  "is_day": 0,

  final double weatherPrecipitation; // "precipitation": 0.00,

  final double weatherWindPressureMsl; // "pressure_msl": 1012.2,

  final double weatherWindSpeed; //  "wind_speed_10m": 1.3,

  final int weatherWindDirection; // "wind_direction_10m": 56,

  final double weatherWindGusts; //  "wind_gusts_10m": 4.0

  // Current Location API key and its models key name
  final double elevation;

  final double latitude;

  final double longitude;

  final String country; // Country: India,

  final String postalCode; // Postal code: 700056,

  final String administrativeArea; //  Administrative area: West Bengal,

  final String
  subAdministrativeArea; //Subadministrative area: Presidency Division,

  final String locality; //Locality: Kolkata,

  final String subLocality; //Sublocality: Belghoria,

  const WeatherReportEntities({
    this.weatherTime = '',
    this.weatherTemperature = 0,
    this.weatherRelativeHumidity = 0,
    this.weatherIsDay = 0,
    this.weatherPrecipitation = 0.0,
    this.elevation = 0.0,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.country = '',
    this.postalCode = '',
    this.administrativeArea = '',
    this.subAdministrativeArea = '',
    this.locality = '',
    this.subLocality = '',
    this.weatherApparentTemperature = 0.0,
    this.weatherWindPressureMsl = 0.0,
    this.weatherWindSpeed = 0.0,
    this.weatherWindDirection = 0,
    this.weatherWindGusts = 0.0,
  });

  @override
  List<Object?> get props => [
    weatherTime,
    weatherTemperature,
    weatherRelativeHumidity,
    weatherIsDay,
    weatherPrecipitation,
    elevation,
    latitude,
    longitude,
    country,
    postalCode,
    administrativeArea,
    subAdministrativeArea,
    locality,
    subLocality,
    weatherApparentTemperature ,
    weatherWindPressureMsl ,
    weatherWindSpeed ,
    weatherWindDirection,
    weatherWindGusts ,
  ];
}
