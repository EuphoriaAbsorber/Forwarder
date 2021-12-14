import 'package:dio/dio.dart';
import 'package:models/models.dart';

const weatherApiPath = '/';

class WeatherApi {
  final Dio _dio;

  WeatherApi(this._dio);

  Future<String> getForecast() async {
    final response = await _dio.get(weatherApiPath);
    return response.data.toString();
  }
}
