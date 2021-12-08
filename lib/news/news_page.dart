import 'dart:convert';

import 'package:city_page/services/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCityPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyCityPage extends StatefulWidget {
  const MyCityPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyCityPage> createState() => _MyCityPageState();
}

class _MyCityPageState extends State<MyCityPage> {
  City city = City("FR");

  List<int>? getTemperature() {
    return null;
  }

  String? getContry() {
    return null;
  }

  double? getTicketCost() {
    return null;
  }

  String? getVisaAdvice() {
    //if text is large, maybe better use stream
    return null;
  }

  Future<void> getNews() async {
    try {
      final options = BaseOptions(queryParameters: {
        'rapidapi-key': '7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
        // 'rapidapi-key': '7b184b96ecmshddca86e95d6b8d8p1e6a1bjsnbaf5607d0ffc',
      });
      final Dio client = Dio(options);
      final url = 'https://coronavirus-smartable.p.rapidapi.com/news/v1/US/';
      var response = await client.get(url);
      var news = jsonDecode(response.data);
      print(news);
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const Scaffold(
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
