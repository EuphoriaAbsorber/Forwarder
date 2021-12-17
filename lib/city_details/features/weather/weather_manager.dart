import 'package:weather/weather.dart';


class WeatherManager {
  final WeatherFactory _weatherFactory;

  WeatherManager(this._weatherFactory);

  Future<List<Weather>> getForecast(double lat, double lng) => _weatherFactory.fiveDayForecastByLocation(lat, lng);

  Future<Weather> getCurrentWeather(double lat, double lng) => _weatherFactory.currentWeatherByLocation(lat, lng);
}
