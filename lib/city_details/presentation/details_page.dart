import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../di.dart';
import '../../map/presentation/map_info.dart';
import '../../weather/presentation/weather_info.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late City city;
  late bool isFavorite;
  final _mapKey = GlobalKey();
  final _appBarKey = GlobalKey();

  final _cityWorker = Dependencies.instance.cityWorker;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    city = arguments['city'] as City? ??
        City(
          id: -1,
          name: 'undefined',
          imgSrc: 'undefined',
          filter: Filter(
            price: 0,
            sea: 0,
            mountains: 0,
            culture: 0,
            architecture: 0,
            shopping: 0,
            entertainment: 0,
            nature: 0,
          ),
          country: 'undefined',
          coords: Coords(lat: 0.0, lng: 0.0),
          description: 'undefined',
        );
    isFavorite = arguments['isFavorite'] as bool? ?? false;
  }

  @override
  Widget build(BuildContext context) => Hero(
        tag: city.id,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                key: _appBarKey,
                pinned: true,
                title: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      city.name,
                      style: const TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                leading: IconButton(
                  splashRadius: 24.0,
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    splashRadius: 24.0,
                    onPressed: () => _addToFavorite(city),
                    icon: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          ),
                  ),
                ],
                backgroundColor: Colors.white,
                forceElevated: innerBoxIsScrolled,
              ),
            ],
            physics: const BouncingScrollPhysics(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        fit: BoxFit.fitWidth,
                        imageUrl: city.imgSrc,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      city.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MapInfo(
                      key: _mapKey,
                      lat: city.coords.lat,
                      lng: city.coords.lng,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(blurRadius: 2.0)],
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Weather', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: WeatherInfo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: WeatherInfo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: WeatherInfo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: WeatherInfo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: WeatherInfo(),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: WeatherInfo(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  void _addToFavorite(City item) {
    if (isFavorite) {
      _cityWorker.removeFromFavorites(item);
      isFavorite = false;
      //_showSnack('Удалено из избраного');
    } else {
      _cityWorker.addToFavorites(item);
      isFavorite = true;
      //_showSnack('Добавлено в избранные');
    }
    setState(() {});
  }
}
