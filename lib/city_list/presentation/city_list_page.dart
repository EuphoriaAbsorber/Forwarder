import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:models/models.dart';

import '../../city_details/presentation/details_page.dart';
import '../../di.dart';
import 'bottom_sheet_filter.dart';
import 'city_card_widget.dart';
import 'search_field.dart';

class CityListPage extends StatefulWidget {
  const CityListPage({Key? key}) : super(key: key);

  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  late final TextEditingController _textController;
  final _cityManager = Dependencies.instance.cityManager;

  @override
  void initState() {
    super.initState();
    _cityManager.fetchCities();
    _textController = TextEditingController();
    _textController.addListener(
        () => _cityManager.searchState.update(_textController.text));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0.0,
                title: SizedBox(
                    height: 40.0,
                    child: SearchField(
                      hint: 'Найди свое...',
                      textController: _textController,
                    )),
                actions: [
                  IconButton(
                    splashRadius: 24.0,
                    iconSize: 36.0,
                    splashColor: Colors.deepOrange.withOpacity(0.3),
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.black54,
                    ),
                    onPressed: () => showModalBottomSheet<void>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                            32.0,
                          ),
                        ),
                      ),
                      context: context,
                      builder: (context) => StreamBuilder<Filter>(
                          stream: _cityManager.filterState.stream,
                          initialData: _cityManager.filterState.state,
                          builder: (context, snapshot) => BottomSheetFilter(
                                // filter: snapshot.hasData ? snapshot.requireData : _cityManager.stateController.currentFilter,
                                filter: snapshot.requireData,
                                onFilterChanged: (changes) =>
                                    _cityManager.filterState.update(changes),
                              )),
                    ),
                  )
                ],
                forceElevated: innerBoxIsScrolled,
              ),
            ],
            body: RefreshIndicator(
              onRefresh: () => _cityManager.fetchCities(),
              child: StreamBuilder<List<CityWithStatus>>(
                stream: _cityManager.cityListState.stream,
                builder: (context, cityListSnapshot) {
                  if (cityListSnapshot.hasData) {
                    final cities = cityListSnapshot.requireData;

                    return StreamBuilder<Filter>(
                        stream: _cityManager.filterState.stream,
                        builder: (context, filterSnapshot) {
                          final citiesFiltered = filterSnapshot.hasData
                              ? cities
                                  .where((c) => check(
                                      filterSnapshot.requireData,
                                      c.city.filter))
                                  .toList()
                              : cities;

                          return StreamBuilder<String>(
                              stream: _cityManager.searchState.stream,
                              builder: (context, searchNameSnapshot) {
                                final citiesSearchedAndFiltered =
                                    searchNameSnapshot.hasData
                                        ? citiesFiltered
                                            .where((element) =>
                                                searchNameSnapshot.requireData
                                                    .toLowerCase()
                                                    .isSubsequence(element
                                                        .city.name
                                                        .toLowerCase()))
                                            .toList()
                                        : citiesFiltered;

                                if (citiesSearchedAndFiltered.isEmpty) {
                                  return Material(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Lottie.asset(
                                            'assets/empty_search_animation.json'),
                                        const Text(
                                          'Не нашлось',
                                          style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return GridView.builder(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 8.0, 8.0, 32.0),
                                    physics: const BouncingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                      childAspectRatio: 0.75,
                                    ),
                                    itemCount: citiesSearchedAndFiltered.length,
                                    itemBuilder: (context, index) => CityCard(
                                      city:
                                          citiesSearchedAndFiltered[index].city,
                                      isFavorite:
                                          citiesSearchedAndFiltered[index]
                                              .isFavorite,
                                      onSelect: () => citiesSearchedAndFiltered[
                                                  index]
                                              .isFavorite
                                          ? _cityManager.removeFromFavorites(
                                              citiesSearchedAndFiltered[index]
                                                  .city)
                                          : _cityManager.addToFavorites(
                                              citiesSearchedAndFiltered[index]
                                                  .city),
                                      onTap: () => Navigator.push(
                                        context,
                                        NotAnimatedRoute(
                                          page: const DetailsPage(),
                                          settings: RouteSettings(
                                            arguments: {
                                              'CityWithStatus':
                                                  citiesSearchedAndFiltered[
                                                      index]
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              });
                        });
                  } else if (cityListSnapshot.hasError) {
                    return Material(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/error_animation.json'),
                          const Text(
                            'Ошибка',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Material(
                      child: Center(
                        child: Lottie.asset('assets/launch_animation.json'),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      );
}

bool check(Filter key, Filter value) =>
    value.price >= key.price &&
    value.sea >= key.sea &&
    value.mountains >= key.mountains &&
    value.culture >= key.culture &&
    value.architecture >= key.architecture &&
    value.shopping >= key.shopping &&
    value.entertainment >= key.entertainment &&
    value.nature >= key.nature;

class NotAnimatedRoute extends PageRouteBuilder {
  NotAnimatedRoute({required Widget page, required RouteSettings settings})
      : super(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
}

extension StringExtension on String {
  bool isSubsequence(String other) {
    if (isEmpty) {
      return true;
    }

    if (other.isEmpty) {
      return false;
    }

    for (var i = 0, j = 0; i < other.length; ++i) {
      if (this[j] == other[i]) {
        if (++j == length) {
          return true;
        }
      }
    }
    return false;
  }
}
