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
  Image? image;

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
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.black,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Картинка",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
    );
  }
}
