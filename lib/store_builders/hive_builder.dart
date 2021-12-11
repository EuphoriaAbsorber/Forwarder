import 'package:hive_flutter/hive_flutter.dart';
import 'package:models/models.dart';

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
