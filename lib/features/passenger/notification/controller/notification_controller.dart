import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notifications = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() {
    notifications.value = [
      'Payment Successfully!',
      '30% Special Discount!',
      // Populate as needed
    ];
  }
}
