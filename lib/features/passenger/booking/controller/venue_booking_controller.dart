import 'package:game_on/core/constants/app_images.dart';
import 'package:get/get.dart';

class VenueBookingController extends GetxController {
  var openingTime = '05:00'.obs;
  var openingPeriod = 'AM'.obs;

  var closingTime = '07:00'.obs;
  var closingPeriod = 'PM'.obs;

  var supportedSports = ['Padel'].obs;
  var additionalServices = ['Parking', 'Rackets', 'Changing Room', 'Balls', 'Water'].obs;
   var currentBannerIndex = 0.obs; // Track current index


    var bannerImages= [
    'assets/app_images/b.png',
    'assets/app_images/b.png',
    'assets/app_images/b.png',
    
  ];

var premiumPackageImages = <String>[
  'assets/app_images/Group 423.png',
  'assets/app_images/Group 424.png'
].obs;

var currentPackageIndex = 0.obs;
}
