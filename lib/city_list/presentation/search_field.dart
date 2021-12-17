import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final TextEditingController textController;

  const SearchField({required this.hint, required this.textController, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: TextField(
        controller: textController,
        scrollPhysics: const BouncingScrollPhysics(),
        cursorColor: Colors.deepOrange,
        textAlignVertical: TextAlignVertical.center,
        style:
        const TextStyle(color: Colors.black, fontSize: 18.0),
        decoration: InputDecoration(
            fillColor: Colors.grey[300],
            filled: true,
            prefixIcon:
            const Icon(Icons.search, color: Colors.black54),
            suffixIcon: IconButton(
              splashRadius: 16.0,
              icon:
              const Icon(Icons.clear, color: Colors.black54),
              onPressed: () => textController.text = '',
            ),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
}
