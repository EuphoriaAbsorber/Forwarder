import 'package:flutter/material.dart';
import 'package:untitled/ui/pages/home_page.dart';

void main() => runApp(const AnyWayApp());

class AnyWayApp extends StatelessWidget {
  const AnyWayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
