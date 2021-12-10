import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/ui/pages/details_page.dart';
import 'package:untitled/ui/pages/home_page.dart';

void main() => runApp(const AnyWayApp());

class AnyWayApp extends StatelessWidget {
  const AnyWayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}
