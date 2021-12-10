import 'package:dio/dio.dart';

class NewsService {
  Future<void> fetchNews() async {
    try {
      final options = BaseOptions(queryParameters: {
        'rapidapi-key': '7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
      });
      final Dio client = Dio(options);
      const url = 'https://coronavirus-smartable.p.rapidapi.com/news/v1/US/';
      //var response = await client.get(url);
      //var news = jsonDecode(response.data);
      //print(news);
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
