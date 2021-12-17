// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketPriceModel _$$_TicketPriceModelFromJson(Map<String, dynamic> json) =>
    _$_TicketPriceModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TicketModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TicketPriceModelToJson(_$_TicketPriceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
