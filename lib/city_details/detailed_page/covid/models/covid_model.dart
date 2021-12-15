import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_model.freezed.dart';
part 'covid_model.g.dart';

@freezed
class CovidModel with _$CovidModel {
  factory CovidModel({
    @JsonKey(name: 'Confirmed') int? confirmed,
    @JsonKey(name: 'Deaths') int? deaths,
    @JsonKey(name: 'Recovered') int? recovered,
    @JsonKey(name: 'Active') int? active,
    @JsonKey(name: 'Date') String? date,
  }) = _CovidModel;

  factory CovidModel.fromJson(Map<String, dynamic> json) => _$CovidModelFromJson(json);
}