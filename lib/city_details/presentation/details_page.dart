import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'package:weather/weather.dart';

import '../../di.dart';
import '../features/covid/presentation/covid_widget.dart';
import '../features/info_widget.dart';
import '../features/map/map_info.dart';
import '../features/tickets/presentation/tickets_widget.dart';
import '../features/weather/presentation/weather_info_list.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late CityWithStatus? _cityWithStatus;
  late bool isFavorite;
  final _mapKey = GlobalKey();

  final _cityManager = Dependencies.instance.cityManager;
  final _weatherManager = Dependencies.instance.weatherManager;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    _cityWithStatus = arguments['CityWithStatus'] as CityWithStatus?;
    isFavorite = _cityWithStatus?.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) => _cityWithStatus != null
      ? Hero(
          tag: _cityWithStatus!.city.id,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  title: Material(
                    color: Colors.transparent,
                    child: FittedBox(
                      child: Text(
                        _cityWithStatus!.city.name,
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
                      onPressed: () => _addToFavorite(_cityWithStatus!.city),
                      icon: isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
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
                          imageUrl: _cityWithStatus!.city.imgSrc,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _cityWithStatus!.city.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MapInfo(
                        key: _mapKey,
                        lat: _cityWithStatus!.city.coords.lat,
                        lng: _cityWithStatus!.city.coords.lng,
                      ),
                    ),
                    FutureBuilder<List<Weather>>(
                      future: _weatherManager.getForecast(
                        _cityWithStatus!.city.coords.lat,
                        _cityWithStatus!.city.coords.lng,
                      ),
                      builder: (context, snapshot) => snapshot.hasData
                          ? InfoWidget(
                              title: 'Погода',
                              child: WeatherInfoList(
                                  weatherList: snapshot.data ?? []),
                            )
                          : const Material(),
                    ),
                    TicketsWidget(
                      _cityWithStatus!.city.name,
                      _cityWithStatus!.city.airport,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 36.0),
                      child: CovidWidget(_cityWithStatus!.city.country),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      : const Material();

  void _addToFavorite(City item) {
    if (isFavorite) {
      _cityManager.removeFromFavorites(item);
      isFavorite = false;
    } else {
      _cityManager.addToFavorites(item);
      isFavorite = true;
    }
    setState(() {});
  }
}
