import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/utils/app_constants.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/pick_up/model/location_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_points/google_polyline_points.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:place_picker_google/place_picker_google.dart';

class LocationController extends GetxController {
  final pickupLocation = Rxn<LatLng>();
  final dropoffLocation = Rxn<LatLng>();
  final pickupAddress = ''.obs;
  final dropoffAddress = ''.obs;
  final selectedDateTime = Rxn<DateTime>();

  final isScheduled = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void setPickupLocation(LatLng latLng, String address) {
    pickupLocation.value = latLng;
    pickupAddress.value = address;
  }

  void setDropoffLocation(LatLng latLng, String address) {
    dropoffLocation.value = latLng;
    dropoffAddress.value = address;
  }

  void setSchedule(DateTime dateTime) {
    selectedDateTime.value = dateTime;
    isScheduled.value = true;
  }

  void resetSchedule() {
    selectedDateTime.value = null;
    isScheduled.value = false;
  }

  String get formattedPickupTime {
    if (selectedDateTime.value == null) return 'Now';
    return DateFormat('yyyy-MM-dd – kk:mm').format(selectedDateTime.value!);
  }

  var selectedCountry = 'Nigeria'.obs;
  var selectedCity = 'Lagos'.obs;

  final countries = ['Nigeria', 'United Kingdom'];
  final cities = {
    'Nigeria': ['Lagos', 'Adamawa', 'Nasarawa', 'Gombe'],
    'United Kingdom': ['Newcastle upon Tyne', 'Nottingham', 'London'],
  };

  void setCountry(String country) {
    selectedCountry.value = country;
    // Reset city to first of the selected country
    selectedCity.value = cities[country]?.first ?? '';
  }

  void setCity(String city) {
    selectedCity.value = city;
  }

  void setPickupAddress(String address) {
    pickupAddress.value = address;
  }

  void setDropoffAddress(String address) {
    dropoffAddress.value = address;
  }

  var rideOptions = <RideOption>[
    RideOption(
      name: 'GO+',
      price: 5000,
      description: 'Business class ride for comfort',
      iconPath: 'assets/app_images/go+ car img.png',
    ),
    RideOption(
      name: 'GO Family',
      price: 5000,
      description: 'Travel with your whole family',
      iconPath: 'assets/app_images/go family car img.png',
    ),
    RideOption(
      name: 'Go Luxury',
      price: 5000,
      description: 'Luxury ride for events',
      iconPath: 'assets/app_images/go luxury car img.png',
    ),
    RideOption(
      name: 'GO',
      price: 5000,
      description: 'GO 4 mins away',
      iconPath: 'assets/app_images/go car img.png',
    ),
  ].obs;
  Map<String, String> countryFlags = {
    'Nigeria': 'assets/app_images/nigeria.png',
    'United Kingdom': 'assets/app_images/United Kingdom.png',
    // Add more mappings
  };

  var selectedRide = 0.obs;

  void selectRide(int index) {
    selectedRide.value = index;
  }

  var currentLatLng = LatLng(6.5244, 3.3792).obs; // Default position
  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;
  var polylineCoordinates = <LatLng>[];

  GoogleMapController? mapController;
  var selectedPickUpLatlng = LatLng(6.5244, 3.3792).obs; // Default position
  var selectedPickUpAddress = "".obs;
  var selectedDropOffLatlng = LatLng(6.5244, 3.3792).obs; // Default position
  var selectedDropOffAddress = "".obs;

  /// ----------- Get the user current Location
  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    LocationData locationData = await location.getLocation();

    // Update current location
    currentLatLng.value = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );

    // Add marker
    addUserCurrentMarker();

    // Move the map camera
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(currentLatLng.value, 15),
      );
    }
  }


  addUserCurrentMarker(){
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: currentLatLng.value,
        infoWindow: const InfoWindow(title: 'My Location'),
      ),
    );
  }

  addDestinationMarker(){
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: currentLatLng.value,
        infoWindow: const InfoWindow(title: 'My Location'),
      ),
    );
  }

  ///
  goolePlacePicker({required bool isPickUp}) {
    Get.to(
      PlacePicker(
        apiKey: gooleMapApiKey,
        // myLocationButtonEnabled: true,
        // myLocationEnabled: true,
        onPlacePicked: (LocationResult result) async {
          debugPrint("latLng picked: ${result.latLng}");
          debugPrint("Place picked: ${result.formattedAddress}");

          if (isPickUp) {
            selectedPickUpLatlng.value = result.latLng!;
            selectedPickUpAddress.value = result.formattedAddress!;
          } else {
            selectedDropOffLatlng .value = result.latLng!;
            selectedDropOffAddress.value = result.formattedAddress!;
            await addPolyline();
            await addDestinationMarker();
            mapController!.animateCamera(
              CameraUpdate.newLatLngZoom(selectedPickUpLatlng.value, 15),
            );
          }

          update();
          Get.back();
        },
        initialLocation: currentLatLng.value,
        searchInputConfig: const SearchInputConfig(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          autofocus: false,
          // textDirection: TextDirection.ltr,
        ),
        searchInputDecorationConfig: const SearchInputDecorationConfig(
          hintText: "Search for a building, street or ...",
        ),
      ),
    );
  }


  Future<void> addPolyline() async {
    polylineCoordinates.clear();

    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      gooleMapApiKey, // Your Google Maps API Key
      LatLngCoordinate(
        selectedPickUpLatlng.value.latitude,
        selectedPickUpLatlng.value.longitude,
      ),
      LatLngCoordinate(
        selectedDropOffLatlng.value.latitude,
        selectedDropOffLatlng.value.longitude,
      ),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      Polyline polyline = Polyline(
        polylineId: const PolylineId('route'),
        points: polylineCoordinates,
        color: const Color(0xFF42A5F5),
        width: 5,
      );

      polylines.clear();
      polylines.add(polyline);
      update();
    } else {
      print("No route found: ${result.errorMessage}");
    }
  }


  clearData(){
    polylineCoordinates.clear();
    polylines.clear();
    markers.clear();
    selectedPickUpAddress.value = '';
    selectedDropOffAddress.value = '';
  }
}
