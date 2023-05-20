import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:veggytably_driver/controllers/profile_controller.dart';
//import 'views/home_page.dart';
import 'controllers/auth_controller.dart';
import 'views/profile_page.dart';
import 'package:veggytably_driver/views/login_page.dart';
import 'package:veggytably_driver/views/home_page.dart';  
import 'package:veggytably_driver/views/home_page/receive_order_body.dart';
import 'package:veggytably_driver/views/home_page/deliver_order_body.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // initialBinding: BindingsBuilder(() {
        //   Get.put(AuthController());
        //   // Get.put(ProfileController());
        // })
        );
  }
}
