import 'package:weather_app/features/weather_report/domain/entities/weather_report_entities.dart';

class LocationAddressModel extends WeatherReportEntities {
  const LocationAddressModel({
    super.country,
    super.administrativeArea,
    super.locality,
    super.postalCode,
    super.subLocality,
    super.subAdministrativeArea,
  });

  LocationAddressModel copyWith({
    String? country,
    String? administrativeArea,
    String? locality,
    String? postalCode,
    String? subLocality,
    String? subAdministrativeArea,
  }) {
    return LocationAddressModel(
      country: country ?? this.country,
      administrativeArea: administrativeArea ?? this.administrativeArea,
      locality: locality ?? this.locality,
      postalCode: postalCode ?? this.postalCode,
      subLocality: subLocality ?? this.subLocality,
      subAdministrativeArea:
          subAdministrativeArea ?? this.subAdministrativeArea,
    );
  }

  @override
  String toString() {
    return 'LocationAddressModel(country: $country, administrativeArea: $administrativeArea, locality: $locality, postalCode: $postalCode, subLocality: $subLocality, subAdministrativeArea: $subAdministrativeArea, )';
  }
}
