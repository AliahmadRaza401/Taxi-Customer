import 'package:flutter/material.dart';
import 'package:game_on/features/passenger/notification/controller/notification_controller.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification')),
      body: Obx(() => ListView.builder(
        itemCount: controller.notifications.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(controller.notifications[index]),
        ),
      )),
    );
  }
}
