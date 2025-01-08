import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late final CameraPosition initialCameraPosition;
  late GoogleMapController mapController;
  late final String _mapStyleString;
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(0, 0),
    );
    _loadMapStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        mapController = controller;
        mapController.setMapStyle(_mapStyleString);
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(0, 0),
      ),
    );
  }

  Future<void> _loadMapStyle() async {
    final response =
        await rootBundle.loadString('assets/styles/map_style.json');
    setState(() {
      _mapStyleString = response;
    });
  }
}
