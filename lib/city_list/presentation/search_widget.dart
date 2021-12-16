import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textController;
  final String text;
  const SearchWidget({Key? key, required this.textController, required this.text}) : super(key: key);



  @override
  Widget build(BuildContext context) => TextField(
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
          hintText: text,
          border: InputBorder.none),
    );
}
