import 'package:data_interface_impl/src/dao/city_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveBuilder {
  final Box<CityHiveModel> cityBox;

  HiveBuilder._(this.cityBox);

  static Future<HiveBuilder> build() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CityHiveModelAdapter());
    return HiveBuilder._(
      await Hive.openBox('cities'),
    );
  }
}
