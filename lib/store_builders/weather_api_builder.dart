import 'package:weather/weather.dart';

const String key = '856822fd8e22db5e1ba48c0e7d69844a';

class WeatherApiBuilder {
  WeatherApiBuilder._();

  static WeatherFactory build() => WeatherFactory(key);
}
