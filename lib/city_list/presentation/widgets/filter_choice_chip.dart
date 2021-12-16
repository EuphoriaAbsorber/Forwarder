import 'package:flutter/material.dart';

class FilterChoiceChip extends StatelessWidget {
  final bool selected;
  final Function onSelected;
  final String category;
  final Icon icon;
  const FilterChoiceChip({
    required this.selected,
    required this.onSelected,
    required this.category,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChoiceChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: icon,
            ),
            Text(
              category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        selected: selected,
        onSelected: (selected) => onSelected(),
      );
}
