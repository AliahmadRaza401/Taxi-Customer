import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/features/passenger/pick_up/model/location_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class LocationController extends GetxController {
  final pickupLocation = Rxn<LatLng>();
  final dropoffLocation = Rxn<LatLng>();
  final pickupAddress = ''.obs;
  final dropoffAddress = ''.obs;
  final selectedDateTime = Rxn<DateTime>();

  final isScheduled = false.obs;

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
    'United Kingdom': ['Newcastle upon Tyne', 'Nottingham', 'London']
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
        iconPath: 'assets/app_images/go+ car img.png'),
    RideOption(
        name: 'GO Family',
        price: 5000,
        description: 'Travel with your whole family',
        iconPath: 'assets/app_images/go family car img.png'),
    RideOption(
        name: 'Go Luxury',
        price: 5000,
        description: 'Luxury ride for events',
        iconPath: 'assets/app_images/go luxury car img.png'),
    RideOption(
        name: 'GO',
        price: 5000,
        description: 'GO 4 mins away',
        iconPath: 'assets/app_images/go car img.png'),
  ].obs;
Map<String, String> countryFlags = {
  'Nigeria':'assets/app_images/nigeria.png',
  'United Kingdom': 'assets/app_images/United Kingdom.png'
  // Add more mappings
};

  var selectedRide = 0.obs;

  void selectRide(int index) {
    selectedRide.value = index;
  }



}