import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/utils/app_toast.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/features/passenger/invite_friend/invite_friend_controller.dart';
import 'package:get/get.dart';

class InviteFriendReferScreen extends GetView<InviteFriendController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(text: 'Invite Friend'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: AppColors.kprimaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Refer & Earn',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'You earn 15\$, your friend gets 40% off on first booking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(AppImages.gitBox, width: 125.w, height: 135.w),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CText(
                text: 'Invite',
                fontSize: 18.sp,
                color: AppColors.primarybackColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInviteIcon(
                  'Whatsapp',
                  AppImages.whatsapp,
                  controller.inviteViaWhatsApp,
                ),
                _buildInviteIcon(
                  'Messenger',
                  AppImages.messenger,
                  controller.inviteViaMessenger,
                ),
                _buildInviteIcon(
                  'Instagram',
                  AppImages.insta,
                  controller.inviteViaInstagram,
                ),
                _buildInviteIcon(
                  'Copy Link',
                  AppImages.link,
                  controller.copyLink,
                ),
              ],
            ),
          ),
          Divider(color: AppColors.dividercolor, endIndent: 20, indent: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Suggested Contact',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    AppToast.infoToast('View all', 'View all contacts tapped');
                  },
                  child: Text(
                    'View all',
                    style: TextStyle(color: AppColors.kprimaryColor),
                  ),
                ),
              ],
            ),
          ),

          // ============ Contact List ==========
          Expanded(
            child: Obx(() {
              return ListView.builder(
                // padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.suggestedContacts.length,
                itemBuilder: (context, index) {
                  final contact = controller.suggestedContacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Text(
                        contact.initials,
                        style: TextStyle(color: AppColors.primarybackColor),
                      ),
                    ),
                    title: Text(contact.name),
                    trailing: TextButton(
                      onPressed: contact.invited
                          ? null
                          : () => controller.inviteContact(index),
                      child: Text(
                        contact.invited ? 'Invited' : 'Invite',
                        style: TextStyle(
                          color: contact.invited
                              ? Colors.grey
                              : AppColors.primaryappcolor,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildInviteIcon(String label, String imageIcon, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey[300],
            child: SvgPicture.asset(imageIcon),
          ),
        ),
        SizedBox(height: 6.h),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }
}
