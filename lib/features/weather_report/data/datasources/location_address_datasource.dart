import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/features/weather_report/data/model/location_address_model.dart';
import 'package:weather_app/features/weather_report/data/model/location_data_model.dart';

class LocationAddressDatasource {
  Future<LocationAddressModel> fetchLocationAddress(
    LocationDataModel location,
  ) async {
    debugPrint("LocationAddressDatasource $location");
    try {
      final address = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      

      final data = address[0];

      return LocationAddressModel(
        administrativeArea: data.administrativeArea ?? "",
        subAdministrativeArea: data.subAdministrativeArea ?? "",
        locality: data.locality ?? '',
        country: data.country??'',
        postalCode: data.postalCode?? '',
        subLocality: data.subLocality??'',
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
