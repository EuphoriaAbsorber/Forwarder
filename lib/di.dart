
import 'city_list/city_manger.dart';
import 'city_list/services/city_api.dart';
import 'city_list/services/city_dao.dart';
import 'store_builders/dio_builder.dart';
import 'store_builders/hive_builder.dart';

class Dependencies {
  final CityManager cityWorker;
  static late final Dependencies instance;

  Dependencies._(this.cityWorker);

  static Future<Dependencies> build() async {
    final dio = DioBuilder.build();
    final hive = await HiveBuilder.build();
    final citiesDao = CityDao(hive.cityBox);
    final cityApi = CityApi(dio);
    final cityManager = CityManager(citiesDao, cityApi);
    return instance = Dependencies._(cityManager);
  }
}