import 'package:flutter/material.dart';
import 'package:game_on/core/constants/app_colors.dart';
import 'package:game_on/core/widgets/primary_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:game_on/features/passenger/pick_up/controller/location_controller.dart';

class PickupScheduleSheet extends StatefulWidget {
  const PickupScheduleSheet({super.key});

  @override
  State<PickupScheduleSheet> createState() => _PickupScheduleSheetState();
}

class _PickupScheduleSheetState extends State<PickupScheduleSheet> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  List<DateTime> getDateOptions() {
    return List.generate(7, (i) => DateTime.now().add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final dateOptions = getDateOptions();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select your pickup time',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.kprimaryColor,
            ),
          ),
          const SizedBox(height: 20),

  SizedBox(
  height: 120, // adjust as needed
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Hour Picker
      Expanded(child: buildDatePicker(dateOptions)),
      Expanded(
        child: ListWheelScrollView.useDelegate(
          itemExtent: 40,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            final hour = index + 1;
            setState(() {
              selectedTime = TimeOfDay(
                hour: selectedTime.period == DayPeriod.pm ? hour + 12 : hour,
                minute: selectedTime.minute,
              );
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 12,
            builder: (context, index) {
              final hour = (index + 1).toString().padLeft(2, '0');
              final isSelected = selectedTime.hourOfPeriod == index + 1;
              return Center(
                child: Text(
                  hour,
                  style: TextStyle(
                    color: isSelected

                        ? AppColors.kprimaryColor
                        : Colors.grey,
                
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      ),

      const Text(":", style: TextStyle(fontSize: 18)),

      // Minute Picker
      Expanded(
        child: ListWheelScrollView.useDelegate(
          itemExtent: 40,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            setState(() {
              selectedTime = TimeOfDay(
                hour: selectedTime.hour,
                minute: index,
              );
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 60,
            builder: (context, index) {
              final minute = index.toString().padLeft(2, '0');
              final isSelected = selectedTime.minute == index;
              return Center(
                child: Text(
                  minute,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.kprimaryColor
                        : Colors.grey,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      ),

      // AM/PM Picker
      Expanded(
        child: ListWheelScrollView(
          itemExtent: 40,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            final period = index == 0 ? DayPeriod.am : DayPeriod.pm;
            final hour = selectedTime.hourOfPeriod;
            setState(() {
              selectedTime = TimeOfDay(
                hour: period == DayPeriod.pm ? hour + 12 : hour,
                minute: selectedTime.minute,
              );
            });
          },
          children: List.generate(2, (index) {
            final period = index == 0 ? 'AM' : 'PM';
            final isSelected =
                selectedTime.period == (index == 0 ? DayPeriod.am : DayPeriod.pm);
            return Center(
              child: Text(
                period,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.kprimaryColor
                      : Colors.grey,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }),
        ),
      ),
    ],
  ),
),




  
          const SizedBox(height: 30),

          // Time selection
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: selectedTime.hourOfPeriod,
                items: List.generate(12, (i) => i + 1)
                    .map(
                      (hour) => DropdownMenuItem(
                        value: hour,
                        child: Text(hour.toString().padLeft(2, '0')),
                      ),
                    )
                    .toList(),
                onChanged: (hour) {
                  if (hour == null) return;
                  setState(() {
                    selectedTime = TimeOfDay(
                      hour: selectedTime.period == DayPeriod.pm
                          ? hour + 12
                          : hour,
                      minute: selectedTime.minute,
                    );
                  });
                },
              ),
              const Text(" : "),
              DropdownButton<int>(
                value: selectedTime.minute,
                items: List.generate(60, (i) => i)
                    .map(
                      (min) => DropdownMenuItem(
                        value: min,
                        child: Text(min.toString().padLeft(2, '0')),
                      ),
                    )
                    .toList(),
                onChanged: (min) {
                  if (min == null) return;
                  setState(() {
                    selectedTime = TimeOfDay(
                      hour: selectedTime.hour,
                      minute: min,
                    );
                  });
                },
              ),
              const SizedBox(width: 10),
              DropdownButton<DayPeriod>(
                value: selectedTime.period,
                items: const [
                  DropdownMenuItem(value: DayPeriod.am, child: Text('AM')),
                  DropdownMenuItem(value: DayPeriod.pm, child: Text('PM')),
                ],
                onChanged: (period) {
                  if (period == null) return;
                  final hour = selectedTime.hourOfPeriod;
                  setState(() {
                    selectedTime = TimeOfDay(
                      hour: period == DayPeriod.pm ? hour + 12 : hour,
                      minute: selectedTime.minute,
                    );
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 30),

          PrimaryButton(
            text: 'Set this date & time',
            onTap: () {
              final controller = Get.find<LocationController>();
              final dateTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
              controller.setSchedule(dateTime);
              Get.back();
            },
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            text: 'Set to current date and time',
            color: AppColors.kwhite,
            tcolor: AppColors.kprimaryColor,
            bcolor: AppColors.kprimaryColor,

            onTap: () {
              Get.find<LocationController>().resetSchedule();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
  Widget buildDatePicker(List<DateTime> dateOptions) {
  int selectedIndex = dateOptions.indexWhere(
    (d) =>
        d.year == selectedDate.year &&
        d.month == selectedDate.month &&
        d.day == selectedDate.day,
  );

  return Stack(
    alignment: Alignment.center,
    children: [
      SizedBox(
        height: 120,
        child: ListWheelScrollView.useDelegate(
          itemExtent: 40,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            setState(() {
              selectedDate = dateOptions[index];
            });
          },
          controller: FixedExtentScrollController(initialItem: selectedIndex),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: dateOptions.length,
            builder: (context, index) {
              final date = dateOptions[index];
              final label = index == 0
                  ? "Today"
                  : index == 1
                      ? "Tomorrow"
                      : DateFormat('EEE d MMM').format(date);
              final isSelected = selectedDate.day == date.day &&
                  selectedDate.month == date.month &&
                  selectedDate.year == date.year;

              return Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected
                        ? AppColors.kprimaryColor
                        : Colors.grey,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      ),

      // Underline
      Positioned(
        bottom: 40, // position under the selected item
        child: Container(
          width: 100,
          height: 2,
          color: AppColors.kprimaryColor,
        ),
      ),
    ],
  );
}

}
