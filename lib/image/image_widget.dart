import 'package:flutter/material.dart';

import '../city.dart';
import 'image_service.dart';

class ImageWidget extends StatefulWidget {
  final String title;

  const ImageWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  City city = City('Chicago', 'US');

  Future<void> getImage() async {
    ImageService service = ImageService();
    service.fetchImage();
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Картинка",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
