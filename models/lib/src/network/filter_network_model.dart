import 'package:json_annotation/json_annotation.dart';

import '../base/filter.dart';

part 'filter_network_model.g.dart';

@JsonSerializable()
class FilterNetworkModel {
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'sea')
  final int sea;
  @JsonKey(name: 'mountains')
  final int mountains;
  @JsonKey(name: 'culture')
  final int culture;
  @JsonKey(name: 'architecture')
  final int architecture;
  @JsonKey(name: 'shopping')
  final int shopping;
  @JsonKey(name: 'entertainment')
  final int entertainment;
  @JsonKey(name: 'nature')
  final int nature;


  const FilterNetworkModel({
    required this.price,
    required this.sea,
    required this.mountains,
    required this.culture,
    required this.architecture,
    required this.shopping,
    required this.entertainment,
    required this.nature,
  });

  factory FilterNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$FilterNetworkModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterNetworkModelToJson(this);

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
