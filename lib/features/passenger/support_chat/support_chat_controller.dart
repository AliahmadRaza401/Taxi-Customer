import 'package:get/get.dart';

class Message {
  final String text;
  final bool isSentByUser;
  final String? avatarInitial; // optional to distinguish senders

  Message({
    required this.text,
    required this.isSentByUser,
    this.avatarInitial,
  });
}

class SupportChatController extends GetxController {
  var messages = <Message>[].obs;
  var typingMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some welcome/support messages
    messages.addAll([
      Message(
          text: "Hi Kitshase, Let me know you need help and you can ask us any questions.",
          isSentByUser: false,
          avatarInitial: 'S'),
    ]);
  }

  void sendMessage() {
    final text = typingMessage.value.trim();
    if (text.isEmpty) return;

    messages.add(Message(text: text, isSentByUser: true, avatarInitial: 'U'));
    typingMessage.value = '';

    // Simulate automatic support reply with delays or logic
    Future.delayed(Duration(seconds: 1), () {
      _addSupportReply(text);
    });
  }

  void _addSupportReply(String userMessage) {
    String reply;
    if (userMessage.toLowerCase().contains('booking')) {
      reply =
          "Hello! I'm sorry for the inconvenience. Let me check your booking details. Could you please confirm your booking ID?";
    } else {
      reply = "Thanks for your message. We will get back to you shortly.";
    }
    messages.add(Message(text: reply, isSentByUser: false, avatarInitial: 'S'));
  }
}
