import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled/weather/month_temperature_model.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  factory WeatherModel({
    @JsonKey(name: 'data') List<MonthTemperatureModel>? months,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
