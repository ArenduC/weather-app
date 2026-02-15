import 'package:equatable/equatable.dart';

class WeatherReportEntities extends Equatable {
  final String weatherTime;

  final double weatherTemperature;

  final int weatherRelativeHumidity;

  final int weatherIsDay;

  final double weatherPrecipitation;

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
  ];
}
