import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_model.freezed.dart';
part 'covid_model.g.dart';

@freezed
class CovidModel with _$CovidModel {
  factory CovidModel({
    @JsonKey(name: 'Cases') int? confirmed,
    @JsonKey(name: 'Date') String? date,
  }) = _CovidModel;

  factory CovidModel.fromJson(Map<String, dynamic> json) => _$CovidModelFromJson(json);
}