import 'package:flutter/material.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/features/passenger/notification/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      CustomAppBar(text: 'Notification'),
      body: Obx(() => ListView.builder(
        itemCount: controller.notifications.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(controller.notifications[index]),
        ),
      )),
    );
  }
}
