import 'package:flutter/material.dart';
import 'package:models/models.dart';

import '../../city_details/presentation/details_page.dart';
import '../../di.dart';
import 'bottom_sheet_filter.dart';
import 'city_card_widget.dart';

class CityListPage extends StatefulWidget {
  const CityListPage({Key? key}) : super(key: key);

  @override
  _CityListPageState createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  late final TextEditingController _textController;

  final _cityWorker = Dependencies.instance.cityWorker;
  late Future<Map<City, bool>> _cityItemsFuture = _cityWorker.getLatest();

  final _appBarKey = GlobalKey();

  Filter filter = Filter(
      price: 0,
      sea: 0,
      mountains: 0,
      culture: 0,
      architecture: 0,
      shopping: 0,
      entertainment: 0,
      nature: 0);

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textController.addListener(() {
      setState(() {});
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
                key: _appBarKey,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0.0,
                title: SizedBox(
                  height: 40.0,
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        boxShadow: [BoxShadow(blurRadius: 2.0)],
                      ),
                    child: TextField(
                      controller: _textController,
                      scrollPhysics: const BouncingScrollPhysics(),
                      cursorColor: Colors.deepOrange,
                      style: const TextStyle(color: Colors.black, fontSize: 18.0),
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.black54),
                        suffixIcon: IconButton(
                          splashRadius: 16.0,
                          icon: const Icon(Icons.clear, color: Colors.black54),
                          onPressed: () => _textController.text = '',
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                        hintText: 'Search your journey...',
                        hintStyle: const TextStyle(
                            color: Colors.black38, fontSize: 18.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.deepOrange, width: 2.5),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    splashRadius: 24.0,
                    iconSize: 36.0,
                    splashColor: Colors.deepOrange.withOpacity(0.3),
                    icon: const Icon(
                      Icons.sort,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          // barrierColor: Colors.bla.withOpacity(0.1),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32.0)),
                          ),
                          context: context,
                          builder: (context) => BottomSheetFilter(
                            initFilter: filter,
                            onFilterChanged: (changes) {
                              setState(() {
                                filter = changes;
                              });
                            },
                          ),
                      ).whenComplete(() => print("Closed!")); //ToDo: Применять поиск когда закрывается!
                    },
                  )
                ],
                forceElevated: innerBoxIsScrolled,
              ),
            ],
            body: RefreshIndicator(
              onRefresh: () async {
                _cityItemsFuture = _cityWorker.getLatest();
                await _cityItemsFuture;
                setState(() {});
              },
              child: FutureBuilder<Map<City, bool>>(
                future: _cityItemsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.requireData;
                    final cities = data.keys
                        .where((element) => _textController.text
                            .toLowerCase()
                            .isSubsequence(element.name.toLowerCase()) && check(filter, element.filter)).toList();

                    return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 32.0),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: cities.length,
                        itemBuilder: (context, index) => GestureDetector(
                              child: CityCard(
                                  city: cities[index],
                                  isFavorite: data[cities[index]] ?? false),
                              onTap: () => Navigator.push(
                                  context,
                                  FadeRoute(
                                      page: const DetailsPage(),
                                      settings: RouteSettings(
                                        arguments: {
                                          'city': cities[index],
                                          'isFavorite':
                                              data[cities[index]] ?? false,
                                        },
                                      ))),
                            ));
                  } else if (snapshot.hasError) {
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

bool check(Filter key, Filter value) =>
    value.price >= key.price &&
        value.sea >= key.sea &&
        value.mountains >= key.mountains &&
        value.culture >= key.culture &&
        value.architecture >= key.architecture &&
        value.shopping >= key.shopping &&
        value.entertainment >= key.entertainment &&
        value.nature >= key.nature;

}

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required Widget page, required RouteSettings settings})
      : super(
            settings: settings,
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                page,
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) => child);
}

extension StringExtension on String {
  bool isSubsequence(String other) {
    if (isEmpty) {
      return true;
    }

    if (other.isEmpty) {
      return false;
    }

    for (int i = 0, j = 0; i < other.length; ++i) {
      if (this[j] == other[i]) {
        if (++j == length) {
          return true;
        }
      }
    }
    return false;
  }
}




