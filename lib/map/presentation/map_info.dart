import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapInfo extends StatelessWidget {
  final double lat;
  final double lng;

  const MapInfo({
    required this.lat,
    required this.lng,
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) => SizedBox(
      height: 240,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GoogleMap(
          mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
            target: LatLng(
              lat,
              lng,
            ),
            zoom: 11,
          ),
        ),
      ),
    );
}
