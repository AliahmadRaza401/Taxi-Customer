import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/constants/app_images.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/custom_text.dart';
import 'package:game_on/core/widgets/custom_textfield.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/features/passenger/payment/controller/payment_controller.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';

class PaymentScreen extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            /// Promo Code TextField
            CustomTextField(
              controller: TextEditingController(),
              onChange: (val) => controller.promoCode.value = val!,
              hintText: 'Promo code',
              keyboardType: TextInputType.text,
              textcolor: AppColors.primaryappcolor,
              hasSuffix: true,
              suffixIcon: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    onChange: (val) => controller.promoCode.value = val!,
                    hintText: 'Enter Promo code',

                    keyboardType: TextInputType.text,
                    textcolor: AppColors.primaryappcolor,
                  ),
                ),
                SizedBox(width: 5.w,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: PrimaryButton(
                    text: 'Apply',
                  
                    width: 90.w,
                    height: 40.w,
                    onTap: () {
                      controller.applyPromo(controller.promoCode.value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            /// Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CText(
                  text: 'Add New Card',
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                Icon(Icons.add, color: AppColors.kprimaryColor),
              ],
            ),

            SizedBox(height: 16.h),

            /// Payment Method Options
            Expanded(
              child: Obx(
                () => ListView(
                  children: [
                    _buildPaymentOption(
                      name: 'Stripe',
                      iconPath: AppImages.stripe,
                      selected:
                          controller.selectedPaymentMethod.value == 'Stripe',
                      onTap: () => controller.selectPayment('Stripe'),
                    ),
                    _buildPaymentOption(
                      name: 'Cash',
                      iconPath: AppImages.cash,
                      selected:
                          controller.selectedPaymentMethod.value == 'Cash',
                      onTap: () => controller.selectPayment('Cash'),
                    ),
                    _buildPaymentOption(
                      name: 'Google Pay',
                      iconPath: AppImages.googlePay,
                      selected:
                          controller.selectedPaymentMethod.value == 'GooglePay',
                      onTap: () => controller.selectPayment('GooglePay'),
                    ),
                    _buildPaymentOption(
                      name: 'Apple Pay',
                      iconPath: AppImages.applePay,
                      selected:
                          controller.selectedPaymentMethod.value == 'ApplePay',
                      onTap: () => controller.selectPayment('ApplePay'),
                    ),
                  ],
                ),
              ),
            ),

            /// Summary + Buttons
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selected:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    controller.selectedPaymentMethod.value,
                    style: TextStyle(
                      color: AppColors.primaryappcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    '₦${controller.price.value}',
                    style: TextStyle(
                      color: AppColors.primaryappcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // ElevatedButton(
            //   onPressed: () => controller.applyPromo(controller.promoCode.value),
            //   child: Text('Apply Promo'),
            // ),
            SizedBox(height: 10.h),

            PrimaryButton(
              text: 'Book Ride',
              onTap: () {
                Get.toNamed(AppRoutes.confirmation);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  /// Reusable Payment Option Widget
  Widget _buildPaymentOption({
    required String name,
    required String iconPath,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 62.h,
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: selected ? AppColors.kprimaryColor : Colors.white,
          border: Border.all(color: AppColors.kformborderColor),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Image.asset(iconPath, width: 32.w),
            ),
            CText(
              text: name,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: selected ? AppColors.kwhite : AppColors.primaryappcolor,
            ),
          ],
        ),
      ),
    );
  }
}
