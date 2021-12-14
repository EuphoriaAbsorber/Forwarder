import 'package:freezed_annotation/freezed_annotation.dart';

part 'coords.freezed.dart';

@freezed
class Coords  with _$Coords {
  factory Coords({
    required double lat,
    required double lng,
  }) = _Coords;
}