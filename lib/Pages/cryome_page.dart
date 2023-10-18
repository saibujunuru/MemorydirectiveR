import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CryomePage extends StatefulWidget {
  const CryomePage({super.key});

  @override
  State<CryomePage> createState() => _CryomePageState();
}

class _CryomePageState extends State<CryomePage> {
  static const LatLng _pGooglePlex = LatLng(22.258652, 71.192383);
  static const LatLng _pApplePark = LatLng(22.258652, 71.192383);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
    body: GoogleMap(initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 13),
    ),
    ),
    );
    }
    }

