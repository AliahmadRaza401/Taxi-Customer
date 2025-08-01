import 'package:flutter/material.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/image_picker_widget.dart';
import 'package:get/get.dart';
import 'package:game_on/features/passenger/chat/controller/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final driverName = Get.arguments['driverName'] ?? "Driver";
    final driverImage = Get.arguments['driverImage'] ?? AppImages.profileImg;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: Column(
        children: [
          /// Custom AppBar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Image.asset(driverImage, width: 62),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        driverName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        "Active now",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),

          /// Chat Messages
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  final isUser = msg.sender == "user";
                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(maxWidth: Get.width * 0.7),
                      decoration: BoxDecoration(
                        color: isUser ? AppColors.kprimaryColor : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: isUser
                              ? const Radius.circular(16)
                              : const Radius.circular(0),
                          bottomRight: isUser
                              ? const Radius.circular(0)
                              : const Radius.circular(16),
                        ),
                        boxShadow: [
                          if (!isUser)
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                        ],
                      ),
                      child: Text(
                        msg.message,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          /// Message Input
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.insert_emoticon, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller.inputController,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                // IconButton(
                //   onPressed: () {
                //     ImagePickerButton(

                //       onImagePicked: (image) {
                //         print('image picker');
                //         if (image != null) {
                //           print('Picked image path: ${image.path}');
                //           // Do something with the image (e.g., upload or preview)
                //         }
                //       },
                //     );
                //   },
                //   icon: Icon(Icons.photo, color: Color(0xff1488CC)),
                // ),
                ImagePickerButton(
                  onImagePicked: (image) {
                    // print('image picker tapped');
                    if (image != null) {
                      // print('Picked image path: ${image.path}');
                    }
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.send, color: AppColors.kprimaryColor),
                  onPressed: () {
                    final text = controller.inputController.text.trim();
                    if (text.isNotEmpty) {
                      controller.sendMessage(text);
                      controller.inputController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
