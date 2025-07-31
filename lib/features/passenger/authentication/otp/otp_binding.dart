// onboarding_binding.dart
import 'package:get/get.dart';
import 'package:game_on/features/passenger/authentication/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
