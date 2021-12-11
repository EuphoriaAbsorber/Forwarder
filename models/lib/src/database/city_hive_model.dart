import 'package:hive/hive.dart';

import '../../models.dart';

part 'city_hive_model.g.dart';

@HiveType(typeId: 0)
class CityHiveModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imgSrc;

  CityHiveModel(this.id, this.name, this.imgSrc);

  CityHiveModel.fromFeed(CityItem feedItem)
      : id = feedItem.id,
        name = feedItem.name,
        imgSrc = feedItem.imgSrc;

  CityItem toCityItem() => CityItem(id: id, name: name, imgSrc: imgSrc);
}
