class DailyHumidityModel {
   final String day;
   final int humidity;

 DailyHumidityModel({required this.day, required this.humidity});


static List<DailyHumidityModel> modelConverter(Map<String, dynamic> data){

  final daily = data;

  final times = daily["time"];
  final humidity = daily["relative_humidity_2m_max"];


  return List.generate(times.length, (i){

    return DailyHumidityModel(day: times[i], humidity: humidity[i]);


  });


}
 
}