import 'package:anyway/city_details/detailed_page/covid/models/covid_model.dart';
import 'package:flutter/material.dart';

import '../services/covid_service.dart';
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

  Future<List<CovidModel>?> getNews() async {
    final service = CovidService();
    return service.fetchCovidInfo();
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) => Column(
      children:[
            NewsCard(),
            NewsCard(),
            NewsCard(),
          ],
    );
}
