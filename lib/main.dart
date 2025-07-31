

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_on/core/constants/app_themes.dart';
import 'package:game_on/core/constants/theme_controller.dart';
import 'package:game_on/routes/app_pages.dart';
import 'package:game_on/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final ThemeController themeController = Get.put(ThemeController());
  
    return ScreenUtilInit(
      designSize: const Size(393, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      
      builder: (_, child) {
        return GetMaterialApp(
           theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          // theme: AppTheme.lightTheme,  
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.routes,
        );
      },
    );
  }
}