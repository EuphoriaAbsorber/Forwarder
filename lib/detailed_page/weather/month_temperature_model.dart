import 'package:freezed_annotation/freezed_annotation.dart';

part 'month_temperature_model.freezed.dart';
part 'month_temperature_model.g.dart';

@freezed
abstract class MonthTemperatureModel with _$MonthTemperatureModel {
  factory MonthTemperatureModel({
    @JsonKey(name: 'tavg') double? tavg,
}) = _MonthTemperatureModel;
  factory MonthTemperatureModel.fromJson(Map<String, dynamic> json) =>
      _$MonthTemperatureModelFromJson(json);
}
