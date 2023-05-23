import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';
import 'package:veggytably_driver/views/login_page.dart';

import 'controllers/geo_controller.dart';
import 'controllers/order_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // comment initial binding for static development
        // set home to LoginPage for sync development
        home: const LoginPage(),
        initialBinding: BindingsBuilder(() {
          Get.put(AuthController());
          Get.put(GeoController());
          Get.put(OrderController());
        }));
  }
}
