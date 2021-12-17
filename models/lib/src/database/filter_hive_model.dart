import 'package:hive/hive.dart';

import '../base/filter.dart';

part 'filter_hive_model.g.dart';

@HiveType(typeId: 1)
class FilterHiveModel extends HiveObject {
  @HiveField(0)
  final int price;
  @HiveField(1)
  final int sea;
  @HiveField(2)
  final int mountains;
  @HiveField(3)
  final int culture;
  @HiveField(4)
  final int architecture;
  @HiveField(5)
  final int shopping;
  @HiveField(6)
  final int entertainment;
  @HiveField(7)
  final int nature;

  FilterHiveModel({
    required this.price,
    required this.sea,
    required this.mountains,
    required this.culture,
    required this.architecture,
    required this.shopping,
    required this.entertainment,
    required this.nature,
  });

  FilterHiveModel.fromFilter(Filter filter)
      : price = filter.price,
        sea = filter.sea,
        mountains = filter.mountains,
        culture = filter.culture,
        architecture = filter.architecture,
        shopping = filter.shopping,
        entertainment = filter.entertainment,
        nature = filter.nature;



  Filter toFilter() => Filter(
      price: price,
      sea: sea,
      mountains: mountains,
      culture: culture,
      architecture: architecture,
      shopping: shopping,
      entertainment: entertainment,
      nature: nature,
  );
}
