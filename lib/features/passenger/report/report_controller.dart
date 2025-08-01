import 'package:get/get.dart';

class ReportController extends GetxController {
  // Reporting options list
  final reportOptions = [
    'I didn\'t feel safe in this ride',
    'I have feedback about the Driver or car',
    'I was involved in an accident',
    'I lost an item',
    'I need help with charges on this ride',
    'Other',
  ];

  var selectedReportIndex = (-1).obs; // No selection initially
  var reportDetail = ''.obs;

  void selectReport(int index) {
    selectedReportIndex.value = index;
    reportDetail.value = '';
  }

  void setReportDetail(String detail) {
    reportDetail.value = detail;
  }

  // Simulate submit with simple logic
  void submitReport() {
    if (selectedReportIndex.value == -1) {
      Get.snackbar('Error', 'Please select a report type');
      return;
    }
    if (reportDetail.value.trim().isEmpty) {
      Get.snackbar('Error', 'Please write more about the problem');
      return;
    }

    // Simulate submission delay
    Get.snackbar('Success', 'Report submitted successfully');
    // Clear after submit
    selectedReportIndex.value = -1;
    reportDetail.value = '';
    // Navigate back or to success screen
    Get.back();
  }
}
