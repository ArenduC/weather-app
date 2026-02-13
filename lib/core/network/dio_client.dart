import 'package:dio/dio.dart';



class DioClient{
 final Dio dio;

 DioClient() : dio = Dio(

  BaseOptions(baseUrl: "https://api.open-meteo.com/v1",
  receiveTimeout: Duration(seconds: 10),
  connectTimeout: Duration(seconds: 10),
  headers: {
    'content-type' :'application/json'
  }  )

 ) {dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, request: true, error: false));}
  
}

