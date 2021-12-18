import 'city_details/features/weather/weather_manager.dart';
import 'city_list/city_manager.dart';
import 'city_list/services/city_api.dart';
import 'city_list/services/city_dao.dart';
import 'store_builders/dio_builder.dart';
import 'store_builders/hive_builder.dart';
import 'store_builders/weather_api_builder.dart';

class Dependencies {
  final CityManager cityManager;
  final WeatherManager weatherManager;

  static late final Dependencies instance;

  Dependencies._({required this.cityManager, required this.weatherManager});

  static Future<Dependencies> build() async {
    final dio = DioBuilder.build();
    final hive = await HiveBuilder.build();
    final citiesDao = CityDao(hive.cityBox);
    final cityApi = CityApi(dio);
    final cityManager = CityManager(citiesDao, cityApi);

    final weatherFactory = WeatherApiBuilder.build();
    final weatherManager = WeatherManager(weatherFactory);

    return instance = Dependencies._(
      cityManager: cityManager,
      weatherManager: weatherManager,
    );
  }
}


