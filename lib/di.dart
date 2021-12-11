import 'package:data_interface_impl/data_inteface_impl.dart';
import 'package:domain/domain.dart';

class Dependencies {
  final CityWorker cityWorker;
  static late final Dependencies instance;

  Dependencies._(this.cityWorker);

  static Future<Dependencies> build() async {
    final dio = DioBuilder.build();
    final hiveBuilder = await HiveBuilder.build();
    final feedDao = CityDaoImpl(hiveBuilder.cityBox);
    final feedApi = CityApiImpl(dio);
    final feedWorker = CityWorker(feedDao, feedApi);
    return instance = Dependencies._(feedWorker);
  }
}