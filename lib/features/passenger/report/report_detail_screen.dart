import 'package:flutter/material.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'report_controller.dart';

class ReportDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReportController>();

    // Get selected report text safely
    final selectedReportText = controller.selectedReportIndex.value != -1
        ? controller.reportOptions[controller.selectedReportIndex.value]
        : '';

    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar:CustomAppBar(text: 'Report'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selectedReportText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              controller: textController,
              maxLines: 6,
              onChanged: controller.setReportDetail,
              decoration: InputDecoration(
                hintText: 'Write more about the problem...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),
            PrimaryButton(
              width: double.infinity,
              text: 'Submit', onTap:(){
               controller.reportDetail.value.trim().isEmpty
                    ? null
                    : 
                        controller.submitReport();
                      
            },),
            
          ],
        ),
      ),
    );
  }
}
