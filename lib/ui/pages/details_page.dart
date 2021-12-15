import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../city_details/detailed_page/covid/presentation/covid_widget.dart';
import '../../city_details/detailed_page/info_widget.dart';
import '../../city_details/detailed_page/tickets/presentation/tickets_widget.dart';
import '../../city_details/detailed_page/weather/presentation/weather_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late int id;
  late String name;
  late String imgSrc;
  late bool isFavorite;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /*final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    id = arguments['id'] ?? -1;
    name = arguments['name'] ?? 'undefined';
    imgSrc = arguments['imgSrc'] ?? 'undefined';
    isFavorite = arguments['isFavorite'] ?? false;*/
  }

  @override
  Widget build(BuildContext context) => Hero(
      tag: id,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: imgSrc,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              if (isFavorite) const Icon(Icons.favorite, color: Colors.red)
              else const Icon(Icons.favorite_border, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                    color: Colors.transparent,
                    child: Text(name,
                        style: const TextStyle(
                            fontSize: 64.0, fontWeight: FontWeight.bold))),
              ),
              const InfoWidget(title: 'Погода',
                child: WeatherWidget(),),
              const InfoWidget(title: 'Covid-19',
                  child: CovidWidget(),),
              const InfoWidget(title: 'Билеты',
                child: TicketsWidget(),),
              ElevatedButton(
                child: const Material(
                    color: Colors.transparent, child: Text('Close')),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
}
