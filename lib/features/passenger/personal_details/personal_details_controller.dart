import 'package:game_on/features/passenger/profile/profile_controller.dart';
import 'package:get/get.dart';

class PersonalDetailsController extends GetxController {
  late ProfileController profileController;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
  }

  void navigateToUpdateName() {
    Get.toNamed('/update-name');
  }

  void navigateToUpdateMobile() {
    Get.toNamed('/update-mobile');
  }

  void navigateToUpdateEmail() {
    Get.toNamed('/update-email');
  }

  void navigateToChangePassword() {
    Get.toNamed('/update-password');
  }
}