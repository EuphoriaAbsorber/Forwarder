import 'package:dio/dio.dart';

class ImageService {
  Future<void> fetchImage() async {
    try {
      final Dio client = Dio();
      const url =
          'https://api.teleport.org/api/urban_areas/slug:cleveland/images/';
      var response = await client.get(url);
      //var  image = response.data;
      //print(image);
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
