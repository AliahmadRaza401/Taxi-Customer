import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/report/report_detail_screen.dart';
import 'package:get/get.dart';
import 'report_controller.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReportController>();

    return Scaffold(
      appBar: CustomAppBar(text: 'Report'),
      body: ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemCount: controller.reportOptions.length,
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[300]),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.reportOptions[index],
              style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () {
              controller.selectReport(index);
              Get.to(() => ReportDetailScreen());
            },
          );
        },
      ),
    );
  }
}
