import 'package:flutter/material.dart';
import 'package:models/models.dart';

class BottomSheetFilter extends StatelessWidget {
  final Filter filter;
  final Function(Filter) onFilterChanged;
  const BottomSheetFilter(
      {required this.onFilterChanged, required this.filter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 420,
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8.0),
              Container(
                width: 64.0,
                height: 8.0,
                decoration: const BoxDecoration(
                  color: Color(0x3336382E),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Фильтр',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.paid,
                              color: Colors.yellow,
                            ),
                          ),
                          Text(
                            'дёшево',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.price != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(price: filter.price ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.pool,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            'море',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.sea != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(sea: filter.sea ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.landscape,
                                color: Colors.brown, size: 32.0),
                          ),
                          Text(
                            'горы',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.mountains != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(mountains: filter.mountains ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.palette,
                              color: Colors.red,
                              size: 32.0,
                            ),
                          ),
                          Text(
                            'культура',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.culture != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(culture: filter.culture ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.eco,
                              color: Colors.lightGreenAccent,
                            ),
                          ),
                          Text(
                            'природа',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.nature != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(nature: filter.nature ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.shopping_bag,
                              color: Colors.orange,
                            ),
                          ),
                          Text(
                            'шопинг',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.shopping != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(shopping: filter.shopping ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.account_balance_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'архитектура',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.architecture != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(architecture: filter.architecture ^ 1),
                      ),
                    ),
                    ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.attractions,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            'развлечения',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      selected: filter.entertainment != 0,
                      onSelected: (selected) => onFilterChanged(
                        filter.copyWith(entertainment: filter.entertainment ^ 1),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: FittedBox(
                          child: OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey.shade300),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Icon(
                                        Icons.quiz,
                                        color: Colors.blue,
                                        size: 30.0,
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        'Пройти опрос',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/questions')),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
