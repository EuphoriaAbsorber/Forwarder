import 'package:freezed_annotation/freezed_annotation.dart';

import 'coords.dart';
import 'filter.dart';

part 'city.freezed.dart';

@freezed
class City  with _$City {
  factory City({
    required int id,
    required String name,
    required String imgSrc,
    required String country,
    required String airport,
    required Coords coords,
    required String description,
    required Filter filter,
  }) = _City;
}
