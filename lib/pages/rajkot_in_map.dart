import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RajkotInMap extends StatefulWidget {
  const RajkotInMap({super.key});

  @override
  State<RajkotInMap> createState() => RajkotInMapState();
}

class RajkotInMapState extends State<RajkotInMap> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kRajkot = CameraPosition(
    target: LatLng(21.2667, 70.7833),
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kRajkot,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _setFromMap(),
        onTap: (LatLng latLng) async {

          Uri uri = Uri.parse('googlemaps://?q=${latLng.latitude},${latLng.longitude}');
          if (await canLaunch(uri.toString())) {
          await launch(uri.toString());
          } else {
          throw 'Could not launch $uri';
          }
        },
      ),
    );
  }

  Set<Marker> _setFromMap() {
    return Set<Marker>.from([
      Marker(
        markerId: MarkerId('Rajkot'),
        position: _kRajkot.target,
        infoWindow: InfoWindow(
          title: 'Rajkot',
          snippet: 'City in Gujarat, India',
        ),
      ),
    ]);
  }
}