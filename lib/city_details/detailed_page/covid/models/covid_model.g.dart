// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CovidModel _$$_CovidModelFromJson(Map<String, dynamic> json) =>
    _$_CovidModel(
      confirmed: json['Confirmed'] as int?,
      deaths: json['Deaths'] as int?,
      recovered: json['Recovered'] as int?,
      active: json['Active'] as int?,
      date: json['Date'] as String?,
    );

Map<String, dynamic> _$$_CovidModelToJson(_$_CovidModel instance) =>
    <String, dynamic>{
      'Confirmed': instance.confirmed,
      'Deaths': instance.deaths,
      'Recovered': instance.recovered,
      'Active': instance.active,
      'Date': instance.date,
    };
