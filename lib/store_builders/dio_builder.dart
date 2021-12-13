import 'package:dio/dio.dart';


const baseApiUrl= 'https://anyway-forwarder-serv.herokuapp.com';

class DioBuilder {
  DioBuilder._();

  static Dio build() => Dio(BaseOptions(
        baseUrl: baseApiUrl,
     ));
}
