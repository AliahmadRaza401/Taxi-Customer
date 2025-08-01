import 'package:flutter/material.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/custom_appbar.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CancelRideScreen extends StatefulWidget {
  const CancelRideScreen({Key? key}) : super(key: key);

  @override
  State<CancelRideScreen> createState() => _CancelRideScreenState();
}

class _CancelRideScreenState extends State<CancelRideScreen> {
  String? selectedReason;

  final List<String> cancelReasons = [
    'Changed my mind',
    'Driver is not coming',
    'Booked by mistake',
    'Found another ride',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(text: 'Cancel Ride'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Reason',
                border: OutlineInputBorder(),
              ),
              value: selectedReason,
              icon: Icon(Icons.keyboard_arrow_down_sharp),
              items: cancelReasons.map((reason) {
                return DropdownMenuItem<String>(
                  value: reason,
                  child: Text(reason),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedReason = value;
                });
              },
            ),
            const SizedBox(height: 24),
            if (selectedReason != null)
              Text(
                'Reason: $selectedReason',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            // const SizedBox(height: 40),
            Spacer(),
            PrimaryButton(
              text: 'Submit',
              onTap: () {
                Get.toNamed(AppRoutes.tripEnd);
              },
            ),
          ],
        ),
      ),
    );
  }
}
