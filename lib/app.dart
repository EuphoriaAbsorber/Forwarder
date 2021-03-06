import 'package:flutter/material.dart';

import '../city_details/presentation/details_page.dart';
import '../city_list/presentation/city_list_page.dart';
import '../di.dart';
import '../question_page/presentation/question_page.dart';

class AnyWayApp extends StatefulWidget {
  const AnyWayApp({Key? key}) : super(key: key);

  @override
  State<AnyWayApp> createState() => _AnyWayAppState();
}

class _AnyWayAppState extends State<AnyWayApp> {
  late final _buildFuture = Dependencies.build();

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _buildFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const CityListPage(),
              '/details': (context) => const DetailsPage(),
              '/questions': (context) => const QuestionPage(),
            },
          );
        } else {
          return const Material();
        }
      },
    );
}
