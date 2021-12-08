import 'package:dio/dio.dart';

class NewsService {
  final Dio _dio;

  const NewsService(this._dio);

  Future<void> fetchNews() async {

      try{
        final options = BaseOptions(queryParameters: {"x-rapidapi-key" : "ad45af4f5amsh9391318c4b87335p1e207bjsn886f23fa28b4"});
        final Dio client = Dio(options);
        var response = await client.get(
            "https://coronavirus-smartable.p.rapidapi.com/news/v1/"+city.name+"/news/1");
        var news = jsonDecode(response.data);
        print(news);
      }
      on DioError catch (e) {
        print(e.toString());
      }
    }
  }
}