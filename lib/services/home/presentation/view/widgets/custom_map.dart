import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roxio/services/home/presentation/view_model/home_cubit.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({super.key});

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late final CameraPosition initialCameraPosition;
  late GoogleMapController mapController;
  late final String _mapStyleString;
  late Position _currentPosition;
  final Set<Marker> _mapMarkers = {};
  late BitmapDescriptor mapIcon;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(0, 0),
    );
    _loadMapStyle();
    initMapIconImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeGetCurrentLocationSuccess) {
          _currentPosition = state.position;
          animateToCurrentLocation();
          addCurrentLocationMarker();
        }
      },
      builder: (context, state) {
        return GoogleMap(
          zoomControlsEnabled: false,
          onMapCreated: (controller) {
            mapController = controller;
            mapController.setMapStyle(_mapStyleString);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(0, 0),
          ),
          markers: _mapMarkers,
        );
      },
    );
  }

  Future<void> _loadMapStyle() async {
    final response =
        await rootBundle.loadString('assets/styles/map_style.json');
    setState(() {
      _mapStyleString = response;
    });
  }

  void animateToCurrentLocation() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
          zoom: 15,
        ),
      ),
    );
  }

  void initMapIconImage() async {
    mapIcon = await BitmapDescriptor.asset(
      ImageConfiguration(
        size: Size(35, 65),
      ),
      'assets/images/current_location_pin.png',
    );
  }

  void addCurrentLocationMarker() {
    _mapMarkers.add(
      Marker(
        markerId: MarkerId('currentLocationMarker'),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        icon: mapIcon,
      ),
    );
  }
}
