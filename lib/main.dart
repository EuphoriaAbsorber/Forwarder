import 'package:flutter/material.dart';
import 'package:untitled/ui/pages/details_page.dart';
import 'package:untitled/ui/pages/home_page.dart';

void main() => runApp(const AnyWayApp());

class AnyWayApp extends StatelessWidget {
  const AnyWayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Theme.of(context).
    return MaterialApp(
      theme: ThemeData.light().copyWith(

      ),

      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}
