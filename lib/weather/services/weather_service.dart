import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherService { //по хорошему тогда не weather а climat
  Future<void> fetchWeather() async {
    try {
      final options = BaseOptions(queryParameters: {
        'rapidapi-key': '7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
      });
      final Dio client = Dio(options);
      const url = 'https://meteostat.p.rapidapi.com/point/normals?lat=59.9127&lon=10.7461&alt=26&start=1961&end=1990';
      //var response = await client.get(url);
      //var  yearWeather = jsonDecode(response.data);
      //print(yearWeather);
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}