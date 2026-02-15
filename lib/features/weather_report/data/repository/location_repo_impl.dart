
import 'package:weather_app/features/weather_report/data/datasources/location_address_datasource.dart';
import 'package:weather_app/features/weather_report/data/datasources/location_datasources.dart';
import 'package:weather_app/features/weather_report/data/model/location_address_model.dart';
import 'package:weather_app/features/weather_report/data/model/location_data_model.dart';
import 'package:weather_app/features/weather_report/domain/repositories/location_repository.dart';

class LocationRepoImpl implements LocationRepository {

  final LocationDatasources locationDatasources;
  final LocationDataModel locationDataModel;
  final LocationAddressDatasource locationAddressDatasource;

  LocationRepoImpl( this.locationDatasources,  this.locationDataModel, this.locationAddressDatasource);




  @override

  Future<LocationDataModel> getLocation() async {

   try {

    final location = await  locationDatasources.determinePosition();

    return LocationDataModel(latitude: location.latitude , longitude: location.longitude);
     
   } catch (e) {
    throw e.toString();
     
   }
  }

  @override
  Future<LocationAddressModel> getLocationAddress(LocationDataModel data) async{

    try {

      final address = await locationAddressDatasource.fetchLocationAddress(data);

      return address;
      
    } catch (e) {

      throw e.toString();
      
    }


  }

}