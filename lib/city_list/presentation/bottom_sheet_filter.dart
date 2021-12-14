import 'package:flutter/material.dart';
import 'package:models/models.dart';
import 'city_list_page.dart';

class BottomSheetFilter extends StatefulWidget {
  final Filter initFilter;
  final Function(Filter) onFilterChanged;
  const BottomSheetFilter({required this.onFilterChanged, required this.initFilter, Key? key}) : super(key: key);

  @override
  _BottomSheetFilterState createState() => _BottomSheetFilterState();
}

class _BottomSheetFilterState extends State<BottomSheetFilter> {

  late Filter filter;

  @override
  void initState() {
    filter = widget.initFilter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 360,
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
                'Filter',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  ChoiceChip(
                    label: const Text(
                      'price',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.price != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(price: filter.price ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'sea',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.sea != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(sea: filter.sea ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'mountains',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.mountains != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(mountains: filter.mountains ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'culture',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.culture != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(culture: filter.culture ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'nature',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.nature != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(nature: filter.nature ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'architecture',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.architecture != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(
                            architecture: filter.architecture ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'shopping',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.shopping != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(shopping: filter.shopping ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ChoiceChip(
                    label: const Text(
                      'entertainment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    selected: filter.entertainment != 0,
                    onSelected: (selected) {
                      setState(() {
                        filter = filter.copyWith(
                            entertainment: filter.entertainment ^ 1);
                      });
                      widget.onFilterChanged(filter);
                    },
                  ),
                  ElevatedButton(
                    child: const Material(
                        color: Colors.transparent, child: Text('Test')),
                    onPressed: () => Navigator.pushNamed(
                        context,  '/questions'
                    )
                  )
                ],
              ),
            )
          ],

        ),

      ),
    );
}
