import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swipe_cards/swipe_cards.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<String> _names = <String>[
    'Что думаете по поводу поездки ',
    'Хотите отправиться ',
    'Что насчёт поездки '
  ];
  final List<String> _namesPart2 = <String>[
    'на море?',
    'в горы?',
    'на природу?'
  ];

  final List<String> _names2 = <String>[
    'Хотите посетить ',
    'Собираетесь посетить ',
    'Отправитесь в ',
  ];

  final List<String> _names2Part2 = <String>[
    'музеи, театры или галереи?',
    'торговые центры и магазины сувениров?',
    'развлекательные места?'
  ];
  final List<String> _names3 = <String>[
    'Важна ли вам ',
    'Имеет ли значение ',
  ];

  final List<String> _names3Part2 = <String>[
    'архитектура города?',
    'бюджетность поездки?'
  ];

  final List<String> _imgs = <String>[
    'https://img.gazeta.ru/files3/839/7947839/upload-shutterstock_109674992-pic905v-895x505-10385.jpg',
    'https://www.travelmanagers.com.au/wp-content/uploads/2012/08/AdobeStock_254529936_Railroad-to-Denali-National-Park-Alaska_750x500.jpg',
    'https://dbdzm869oupei.cloudfront.net/img/photomural/preview/48792.png',
    'https://blog.edinoepole.ru/wp-content/uploads/2016/08/km091.jpg',
    'https://image.freepik.com/free-photo/female-friends-out-shopping-together_53876-25041.jpg',
    'https://georgiabest.ru/wp-content/uploads/2017/12/Karusel-dlya-malenkih-v-TSitsinatela.jpg',
    'https://media.cntraveler.com/photos/593af2cf986db21b5a8a00da/16:9/w_2580,c_limit/architecture-cities-rome-GS1130862.jpg',
    'https://dfi.wa.gov/sites/default/files/budget-16x9.jpg'
  ];

  @override
  void initState() {
    List<String> questions = <String>[];
    for (var i = 0; i < _namesPart2.length; i++) {
      questions
          .add(_names[Random().nextInt(_namesPart2.length)] + _namesPart2[i]);
    }
    for (var i = 0; i < _names2Part2.length; i++) {
      questions.add(
          _names2[Random().nextInt(_names2Part2.length)] + _names2Part2[i]);
    }
    for (var i = 0; i < _names3Part2.length; i++) {
      questions.add(
          _names3[Random().nextInt(_names3Part2.length)] + _names3Part2[i]);
    }

    for (var i = 0; i < 8; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: questions[i], imgUrl: _imgs[i]),
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {
            //Navigator.pop(context);
          }));
    }
    _swipeItems.shuffle();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (context, index) => Container(
                  height: 600,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [BoxShadow(blurRadius: 2.0)],
                  ),
                  //alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          fit: BoxFit.fitHeight,
                          imageUrl: _swipeItems[index].content.imgUrl as String,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Column(
                        children: [
                          const Expanded(flex: 5, child: SizedBox.shrink()),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black.withOpacity(0.4),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    _swipeItems[index].content.text as String,
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(flex: 2, child: SizedBox.shrink()),
                        ],
                      )
                    ]),
                  ),
                ),
                onStackFinished: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {
                          _matchEngine.currentItem?.nope();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.lightBlue.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.home,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.lightGreen.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {
                          _matchEngine.currentItem?.like();
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 30.0,
                        ),
                      ),
                    )
                  ],
                )),
          ]),
        ),
      );
}

class Content {
  final String text;
  final String imgUrl;

  Content({required this.text, required this.imgUrl});
}
