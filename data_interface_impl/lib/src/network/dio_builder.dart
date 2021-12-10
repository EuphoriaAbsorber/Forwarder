import 'package:dio/dio.dart';


//ToDo: Заполнить базовый адрес api
final BASE_API_URL= '';

class DioBuilder {
  DioBuilder._();

  static Dio build() => Dio(BaseOptions(
        baseUrl: BASE_API_URL,
     ));
}
