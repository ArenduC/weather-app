import 'package:weather_app/features/weather_report/domain/entities/weather_report_entities.dart';

class LocationDataModel extends WeatherReportEntities {
  const LocationDataModel({required super.latitude, required super.longitude});

  LocationDataModel copyWith({double? latitude, double? longitude}) {
    return LocationDataModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

   @override
  String toString() {
    return 'LocationDataModel(latitude: $latitude, longitude: $longitude)';
  }
}
