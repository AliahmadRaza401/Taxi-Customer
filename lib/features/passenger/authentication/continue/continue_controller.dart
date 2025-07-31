import 'package:get/get.dart';

class ContinueController extends GetxController {
  var isLoading = false.obs;

  Future<void> continueAuthentication() async {
    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      isLoading.value = false;
    }
  }
}
