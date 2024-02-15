import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/utils/screen_routes.dart';
import 'package:db_miner/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeController controller = Get.put(HomeController());
void main() {
  runApp(
    Obx(
      () {
        controller.changeTheme();
        return GetMaterialApp(
          theme: controller.isLight.value?darkTheme:lightTheme,
          debugShowCheckedModeBanner: false,
          routes: screen_routes,
        );
      },
    ),
  );
}
/*
 Consumer<ThemeProvider>(
        builder: (context, value, child) {
          value.changeTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: app_routes,
            theme: value.isLight ? darkTheme : lightTheme,
          );
        },
      ),
 */