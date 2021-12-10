import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/weather/weather_model.dart';

class WeatherService {
  //по хорошему тогда не weather а climat

  Future<WeatherModel?> fetchWeather() async {
    final options = BaseOptions(queryParameters: {
      'rapidapi-key': '7ec289add4msh2db3692dccdf859p11b0fejsn010a2ce89e26'
      //'7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
    });
    final Dio client = Dio(options);
    const url =
        'https://meteostat.p.rapidapi.com/point/normals?lat=59.9127&lon=10.7461&alt=26&start=1961&end=1990';
    try {
      final response = await client.get(url);
      final weatherData = WeatherModel.fromJson(response.data);
      return weatherData;
      //print(weatherData.toString());
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
