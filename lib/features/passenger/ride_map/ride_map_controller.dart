import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_on/features/passenger/ride_details/ride_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideMapController extends GetxController {
  var selectedRide = Rxn<RideModel>();
  Completer<GoogleMapController> mapController = Completer();
  
  // Default position (Lagos, Nigeria)
  var initialPosition = LatLng(6.5244, 3.3792).obs;
  
  // Markers and polylines
  var markers = <Marker>[].obs;
  var polylines = <Polyline>[].obs;
  
  // Sample coordinates for pickup and dropoff
  final LatLng pickupLocation = LatLng(6.5244, 3.3792); // Lagos Island
  final LatLng dropoffLocation = LatLng(6.4698, 3.6043); // Lekki

  @override
  void onInit() {
    super.onInit();
    selectedRide.value = Get.arguments as RideModel?;
    setupMapData();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    animateToShowBothMarkers();
  }

  void setupMapData() {
    // Create markers
    markers.addAll([
      Marker(
        markerId: MarkerId('pickup'),
        position: pickupLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(
          title: 'Pickup Location',
          snippet: 'Park Slope, Nigeria',
        ),
      ),
      Marker(
        markerId: MarkerId('dropoff'),
        position: dropoffLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
          title: 'Dropoff Location',
          snippet: 'Bay Ridge, Nigeria',
        ),
      ),
    ]);

    // Create polyline for route
    polylines.add(
      Polyline(
        polylineId: PolylineId('route'),
        points: [pickupLocation, dropoffLocation],
        color: Colors.blue,
        width: 4,
        patterns: [],
      ),
    );
  }

  void animateToShowBothMarkers() async {
    final GoogleMapController controller = await mapController.future;
    
    // Calculate bounds to show both markers
    double minLat = pickupLocation.latitude < dropoffLocation.latitude 
        ? pickupLocation.latitude : dropoffLocation.latitude;
    double maxLat = pickupLocation.latitude > dropoffLocation.latitude 
        ? pickupLocation.latitude : dropoffLocation.latitude;
    double minLng = pickupLocation.longitude < dropoffLocation.longitude 
        ? pickupLocation.longitude : dropoffLocation.longitude;
    double maxLng = pickupLocation.longitude > dropoffLocation.longitude 
        ? pickupLocation.longitude : dropoffLocation.longitude;

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(minLat - 0.01, minLng - 0.01),
      northeast: LatLng(maxLat + 0.01, maxLng + 0.01),
    );

    controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100.0));
  }
}