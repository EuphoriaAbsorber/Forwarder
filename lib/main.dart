import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:untitled/city_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CityCard> cities = [];

  bool loading = true;

  void getCities() async{
    final dio = Dio();

    final response =   await dio.get('https://anyway-forwarder-serv.herokuapp.com');
    // final yourModel = YourModel.fromJson(response.data);
    //print(response.data);
    //var JsonData = CityCard.fromJson(response.data);
    //print(JsonData);
    List<CityCard> s = [];
    for(var m in response.data){
      CityCard d = CityCard.fromJson(m);
      s.add(d);
    }
    //print(s[0].title);
    //loading = false;
    setState(() {cities = s;loading = !loading;});
    print(cities[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
             ...cities
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getCities,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

