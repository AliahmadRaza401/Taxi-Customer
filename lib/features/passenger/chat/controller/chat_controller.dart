import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:game_on/features/passenger/chat/model/chat_model.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> messages = <ChatMessage>[].obs;
  TextEditingController inputController = TextEditingController();

  void sendMessage(String text) {
    messages.add(ChatMessage(sender: "user", message: text));

    // Simulate a response
    Future.delayed(const Duration(seconds: 2), () {
      messages.add(ChatMessage(sender: "driver", message: "Thanks for your message."));
    });
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
