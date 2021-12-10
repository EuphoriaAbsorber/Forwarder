import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/detailed_page/news/services/news_service.dart';

import '../../../city.dart';
import 'news_card.dart';

class NewsWidget extends StatefulWidget {
  // Stateful нужен наверное, для хранения
  // на этой странице того какой сейчас город
  const NewsWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  City city =
      City('Chicago', 'US'); // хотим брать сверху из состояния странички города

  Future<void> getNews() async {
    NewsService service = NewsService();
    service.fetchNews();
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        //width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Новости",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Flexible(child: NewsCard()),
            Flexible(child: NewsCard()),
            Flexible(child: NewsCard()),
          ],
        ),
      ),
    );
  }
}
