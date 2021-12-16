import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
class Filter with _$Filter {
  factory Filter({
    required int price,
    required int sea,
    required int mountains,
    required int culture,
    required int architecture,
    required int shopping,
    required int entertainment,
    required int nature,
  }) = _Filter;
}
