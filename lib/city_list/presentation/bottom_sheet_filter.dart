import 'package:flutter/material.dart';
import 'package:models/models.dart';

import 'filter_choice_chip.dart';

class BottomSheetFilter extends StatelessWidget {
  final Filter filter;
  final Function(Filter) onFilterChanged;
  const BottomSheetFilter(
      {required this.onFilterChanged, required this.filter, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 460,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 64.0,
                height: 8.0,
                decoration: const BoxDecoration(
                  color: Color(0x3336382E),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
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
                  FilterChoiceChip(
                    selected: filter.price != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(price: filter.price ^ 1),
                    ),
                    category: 'дёшево',
                    icon: const Icon(
                      Icons.paid,
                      color: Colors.yellow,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.sea != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(sea: filter.sea ^ 1),
                    ),
                    category: 'море',
                    icon: const Icon(
                      Icons.pool,
                      color: Colors.blue,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.mountains != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(mountains: filter.mountains ^ 1),
                    ),
                    category: 'горы',
                    icon: const Icon(
                      Icons.landscape,
                      color: Colors.brown,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.culture != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(culture: filter.culture ^ 1),
                    ),
                    category: 'культура',
                    icon: const Icon(
                      Icons.palette,
                      color: Colors.red,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.nature != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(nature: filter.nature ^ 1),
                    ),
                    category: 'природа',
                    icon: const Icon(
                      Icons.eco,
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.shopping != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(shopping: filter.shopping ^ 1),
                    ),
                    category: 'шопинг',
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.orange,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.architecture != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(architecture: filter.architecture ^ 1),
                    ),
                    category: 'архитектура',
                    icon: const Icon(
                      Icons.account_balance_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  FilterChoiceChip(
                    selected: filter.entertainment != 0,
                    onSelected: () => onFilterChanged(
                      filter.copyWith(entertainment: filter.entertainment ^ 1),
                    ),
                    category: 'развлечения',
                    icon: const Icon(
                      Icons.attractions,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: FittedBox(
                        child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
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
      );
}
