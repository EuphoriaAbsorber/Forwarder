// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CovidModel _$$_CovidModelFromJson(Map<String, dynamic> json) =>
    _$_CovidModel(
      confirmed: json['Cases'] as int?,
      date: json['Date'] as String?,
    );

Map<String, dynamic> _$$_CovidModelToJson(_$_CovidModel instance) =>
    <String, dynamic>{
      'Cases': instance.confirmed,
      'Date': instance.date,
    };
