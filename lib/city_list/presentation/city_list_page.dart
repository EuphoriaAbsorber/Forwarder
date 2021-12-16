import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../city_details/presentation/details_page.dart';
import '../../di.dart';
import 'bottom_sheet_filter.dart';
import 'city_card_widget.dart';
import 'widgets/search_field.dart';

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
    _textController.addListener(() {
      _cityManager.stateController.updateSearch(_textController.text);
    });
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
                          stream: _cityManager.stateController.getStream,
                          initialData: _cityManager.stateController.currentFilter,
                          builder: (context, snapshot) => BottomSheetFilter(
                                // filter: snapshot.hasData ? snapshot.requireData : _cityManager.stateController.currentFilter,
                                filter: snapshot.requireData,
                                onFilterChanged: (changes) => _cityManager
                                    .stateController
                                    .updateFilter(changes),
                              )),
                    ),
                  )
                ],
                forceElevated: innerBoxIsScrolled,
              ),
            ],
            body: RefreshIndicator(
              onRefresh: () => _cityManager.fetchCities(),
              child: StreamBuilder<List<Pair<City, bool>>>(
                stream: _cityManager.stateController.cityListStream,
                builder: (context, cityListSnapshot) {
                  if (cityListSnapshot.hasData) {
                    final cities = cityListSnapshot.requireData;

                    return StreamBuilder<Filter>(
                        stream: _cityManager.stateController.getStream,
                        builder: (context, filterSnapshot) {
                          final citiesFiltered = filterSnapshot.hasData
                              ? cities
                                  .where((element) => check(
                                      filterSnapshot.requireData,
                                      element.first.filter))
                                  .toList()
                              : cities;

                          return StreamBuilder<String>(
                              stream: _cityManager.stateController.searchStream,
                              builder: (context, searchNameSnapshot) {
                                final citiesSearchedAndFiltered =
                                    searchNameSnapshot.hasData
                                        ? citiesFiltered
                                            .where((element) =>
                                                searchNameSnapshot.requireData
                                                    .toLowerCase()
                                                    .isSubsequence(element
                                                        .first.name
                                                        .toLowerCase()))
                                            .toList()
                                        : citiesFiltered;

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
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    child: CityCard(
                                        city: citiesSearchedAndFiltered[index]
                                            .first,
                                        isFavorite:
                                            citiesSearchedAndFiltered[index]
                                                .second),
                                    onTap: () => Navigator.push(
                                      context,
                                      NotAnimatedRoute(
                                        page: const DetailsPage(),
                                        settings: RouteSettings(
                                          arguments: {
                                            'city':
                                                citiesSearchedAndFiltered[index]
                                                    .first,
                                            'isFavorite':
                                                citiesSearchedAndFiltered[index]
                                                    .second,
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        });
                  } else if (cityListSnapshot.hasError) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
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
