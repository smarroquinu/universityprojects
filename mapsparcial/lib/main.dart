import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 4',
      theme: ThemeData(primaryColor: Colors.white),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(13.692045, -89.228534), zoom: 11.5);
  GoogleMapController? _googleMapController;
  Marker _arce = Marker(
      markerId: MarkerId('arce'),
      infoWindow:
          InfoWindow(title: 'Sucursal ciudad Arce', snippet: 'Ciudad Arce'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      position: LatLng(13.854391, -89.452945));
  Marker _salvadorDelMundo = Marker(
      markerId: MarkerId('salvador'),
      infoWindow: InfoWindow(
          title: 'Sucursal Salvador del mundo', snippet: 'Salvador del mundo'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      position: LatLng(13.701129, -89.224777));
  Marker _sanJacinto = Marker(
      markerId: MarkerId('sanJacinto'),
      infoWindow:
          InfoWindow(title: 'Sucursal San Jacinto', snippet: 'San Jacinto'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      position: LatLng(13.968994, -89.470382));
  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      myLocationButtonEnabled: false,
      initialCameraPosition: _initialCameraPosition,
      onMapCreated: (controller) => _googleMapController = controller,
      markers: {_arce, _salvadorDelMundo, _sanJacinto},
    ));
  }
}
