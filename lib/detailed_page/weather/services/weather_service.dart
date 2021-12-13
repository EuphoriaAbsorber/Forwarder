import 'package:dio/dio.dart';


class WeatherService {
  //по хорошему тогда не weather а climat

  Future<void> fetchWeather() async {
    final options = BaseOptions(queryParameters: {
      'appid': '660591836ec3ecb62d7152096a6026b5'
      //'7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
    });
    final Dio client = Dio(options);
    const url = 'https://api.openweathermap.org/data/2.5/onecall/timemachine?lat={lat}&lon={lon}&dt={time}';
    try {
      final response = await client.get(url, queryParameters: {'lat':60.99,
      'lon': 30.9,
      'dt' : 1586468027});
      final weatherData = 0;//WeatherModel.fromJson(response.data);
      //return weatherData;
      //print(weatherData.toString());
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
