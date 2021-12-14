import 'package:hive_flutter/hive_flutter.dart';
import 'package:models/models.dart';

class HiveBuilder {
  final Box<CityHiveModel> cityBox;
  final Box<FilterHiveModel> filterBox;

  HiveBuilder._(this.cityBox, this.filterBox);

  static Future<HiveBuilder> build() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CityHiveModelAdapter());
    Hive.registerAdapter(FilterHiveModelAdapter());
    Hive.registerAdapter(CoordsHiveModelAdapter());
    return HiveBuilder._(
      await Hive.openBox('cities'),
      await Hive.openBox('filters'),
    );
  }
}
