import 'package:data/data.dart';
import 'package:dio/dio.dart';

import 'city_network_model.dart';

//ToDo: Заполнить адрес api с городами
final CITY_API_PATH = '';

class CityApiImpl extends CityApi {
  final Dio _dio;

  CityApiImpl(this._dio);

  @override
  Future<List<CityItem>> getLatest() async {
    //final response = await _dio.get(CITY_API_PATH);

    //ToDo: Напишите логику получения спискаа городов
    /*final cities = response.data[''] as Map;
    return cities.values
        .expand((element) => element)
        .map((e) => CityNetworkModel.fromJson(e).toCityItem())
        .toList();*/

    //ToDo: Пока возращает заглушку
    return Future.delayed(Duration(seconds: 5)).then((value) => [
      CityItem(id: 0, name: "Test0", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 1, name: "Test1", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 2, name: "Test2", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 3, name: "Test3", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 4, name: "Test4", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 5, name: "Test5", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 6, name: "Test6", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      CityItem(id: 7, name: "Test7", imgSrc: "https://pbs.twimg.com/media/ED_yIKlWwAAAQQF.jpg"),
      ]
    );
  }
}
