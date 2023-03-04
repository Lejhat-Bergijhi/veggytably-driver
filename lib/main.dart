import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

//import 'views/home_page.dart';
import 'views/profile_page.dart';
import 'views/signup_page_1.dart';
import 'views/signup_page_2.dart';
import 'package:veggytably_driver/views/login_page.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
