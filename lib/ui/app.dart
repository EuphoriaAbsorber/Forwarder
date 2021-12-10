import 'package:flutter/material.dart';

import 'pages/details_page.dart';
import 'pages/home_page.dart';

import '../di.dart';

class AnyWayApp extends StatefulWidget {
  const AnyWayApp({Key? key}) : super(key: key);

  @override
  State<AnyWayApp> createState() => _AnyWayAppState();
}

class _AnyWayAppState extends State<AnyWayApp> {
  late final _buildFuture = Dependencies.build();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buildFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const HomePage(),
              '/details': (context) => const DetailsPage(),
            },
          );
        } else {
          return const Material();
        }
      },
    );
  }
}
