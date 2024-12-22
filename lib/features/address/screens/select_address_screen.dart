import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stackfood_multivendor/common/widgets/build_button_widget.dart';

import '../../home_tap/screen/home_tap_screen.dart';

class SelectAddressScreen extends StatefulWidget {
  const SelectAddressScreen({super.key});

  @override
  State<SelectAddressScreen> createState() => _SelectAddressScreenState();
}

class _SelectAddressScreenState extends State<SelectAddressScreen> {
  late GoogleMapController mapController;

  final LatLng _initialPosition = const LatLng(37.7749, -122.4194); // Default to San Francisco
  LatLng _pickedLocation = const LatLng(37.7749, -122.4194);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _pickLocation(LatLng location) {
    setState(() {
      _pickedLocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 12.0,
            ),
            onTap: _pickLocation, // Select location on tap
            markers: {
              Marker(
                markerId: MarkerId("picked-location"),
                position: _pickedLocation,
              ),
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: BuildButtonWidget(txt: "Pick Location",onTap: () => Get.to(() => HomeTapScreen()),),
          ),
        ],
      ),
    );
  }
}
