import 'package:freezed_annotation/freezed_annotation.dart';

import 'ticket_model.dart';

part 'ticket_price_model.freezed.dart';
part 'ticket_price_model.g.dart';

@freezed
abstract class TicketPriceModel with _$TicketPriceModel {
  factory TicketPriceModel({
    @JsonKey(name: 'data') List<TicketModel>? data,
  }) = _TicketPriceModel;

  factory TicketPriceModel.fromJson(Map<String, dynamic> json) =>
      _$TicketPriceModelFromJson(json);
}
