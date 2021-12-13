import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/detailed_page/covid/services/covid_service.dart';
import 'package:untitled/detailed_page/info_widget.dart';

import '../../../city.dart';
import 'covid_card.dart';

class CovidWidget extends StatefulWidget {
  // Stateful нужен наверное, для хранения
  // на этой странице того какой сейчас город
  const CovidWidget({Key? key}) : super(key: key);

  @override
  State<CovidWidget> createState() => _CovidWidgetState();
}

class _CovidWidgetState extends State<CovidWidget> {
  //CityItem city = CityItem(id: \, name: name, imgSrc: imgSrc)// хотим брать сверху из состояния странички города

  Future<void> getNews() async {
    CovidService service = CovidService();
    await service.fetchCovidInfo();
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
            NewsCard(),
            NewsCard(),
            NewsCard(),
          ],
    );
  }
}
