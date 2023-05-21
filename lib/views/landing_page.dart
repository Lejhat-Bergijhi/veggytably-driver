import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/controllers/profile_controller.dart';
import 'package:veggytably_driver/views/profile_page.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();

  final List<Widget> pages = [
    const Placeholder(), // history page
    const HomePage(),
    const ProfilePageDriver(),
  ];

  final RxInt pageIndex = 1.obs;

  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => pages[pageIndex.value],
      ),
      bottomNavigationBar: Container(
        height: 82.7,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 230),
                spreadRadius: 0,
                blurRadius: 20),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomNavigationBar(
            currentIndex: pageIndex.value,
            onTap: (index) => pageIndex.value = index,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
            // onTap: _onItemTapped,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black38,
          ),
        ),
      ),
    );
  }
}
