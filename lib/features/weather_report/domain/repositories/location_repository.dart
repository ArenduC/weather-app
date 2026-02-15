
import 'package:weather_app/features/weather_report/data/model/location_address_model.dart';
import 'package:weather_app/features/weather_report/data/model/location_data_model.dart';

abstract class LocationRepository {

  Future<LocationDataModel> getLocation();
  Future<LocationAddressModel> getLocationAddress(LocationDataModel location);
}