import 'package:flutter/material.dart';

import 'city_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child:
          CityPage(title: 'city'),
        )
      ),
    );
  }

}
