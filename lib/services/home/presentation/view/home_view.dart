import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(37.42796133580664, -122.085749655962),
        zoom: 14.4746,
      ),
    );
  }
}
