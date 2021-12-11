import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/detailed_page/news/presentation/news_widget.dart';
import 'package:untitled/detailed_page/tickets/tickets_widget.dart';
import 'package:untitled/detailed_page/weather/presentation/weather_widget.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    id = arguments['id'] ?? -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: id,
            child: CachedNetworkImage(
              imageUrl: "https://media.architecturaldigest.com/photos/58f918044f42bd463db36a3f/16:9/w_1280,c_limit/1%20-%2010%20Greenest%20Cities%20in%20America%20in%202017.jpg",
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),

          const Text(
            'City', //TODO: добавить название города
            //style: TextStyle(color: Colors.black),
          ),
          const TicketsWidget(title: 'tickets'),
          //const WeatherWidget(title: 'weather'),
          const NewsWidget(title: 'news'),
          ElevatedButton(
            child: const Text('Close'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
