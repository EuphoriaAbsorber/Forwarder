import 'package:city_page/services/utils.dart';

class NewsResponse {
  final List<New> list;

  NewsResponse(this.list);

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      NewsResponse(json['news'])
