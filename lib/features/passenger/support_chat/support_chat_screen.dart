import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/utils/app_toast.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/image_picker_widget.dart';
import 'package:get/get.dart';
import 'support_chat_controller.dart';

class SupportChatScreen extends GetView<SupportChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CText(text: 'Support', fontWeight: FontWeight.bold,fontSize: 20,),
        leading: BackButton(color: AppColors.primarybackColor,),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: AppColors.primarybackColor,),
            onPressed: () {
              // Implement search if needed
              // Get.snackbar('Search', 'Search clicked');
              AppToast.infoToast('Search', 'Search clicked');
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(12),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    //  ======= Reverse list so newest message is at bottom ====== 
                    final reversedIndex = controller.messages.length - 1 - index;
                    final message = controller.messages[reversedIndex];
                    return _buildMessageBubble(message);
                  },
                )),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    final isUser = message.isSentByUser;
    final bgColor = isUser ? AppColors.kredColor.withOpacity(0.3)  : Colors.grey[200] ;
    final align = isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final textColor = isUser ? AppColors.kprimaryColor : Colors.black87;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(message.avatarInitial ?? 'S'),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      isUser ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      isUser ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              child: Text(message.text, style: TextStyle(color: textColor)),
            ),
          ),
          if (isUser) _buildAvatar(message.avatarInitial ?? 'U'),
        ],
      ),
    );
  }

  Widget _buildAvatar(String initials) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(initials, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 6, 12),
      color: Colors.white,
      child: Row(
        children: [
               ImagePickerButton(iconColor: AppColors.kHeadingColor,),
          // GestureDetector(
          //   onTap: () {
          //     ImagePickerButton();
          //   },
          //   child: Icon(Icons.camera_alt_outlined, color: Colors.black45)),
          SizedBox(width: 12),
          Expanded(
            child: Obx(() => TextField(
                  controller: TextEditingController()
                    ..text = controller.typingMessage.value
                    ..selection = TextSelection.collapsed(
                        offset: controller.typingMessage.value.length),
                  onChanged: (val) => controller.typingMessage.value = val,
                  decoration: InputDecoration(
                    hintText: "Write a comment",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    isDense: true,
                  ),
                )),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: controller.sendMessage,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.send_outlined,
                color:AppColors.primaryappcolor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
