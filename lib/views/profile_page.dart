import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/controllers/profile_controller.dart';
import 'package:veggytably_driver/views/login_page.dart';

import '../widgets/image_profile.dart';

class ProfilePageDriver extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  ProfilePageDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 38),
          Container(
              height: 205,
              padding: const EdgeInsets.only(left: 78, right: 78),
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageProfile(),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        child: Obx(() => Text(profileController.username.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w500,
                            ))),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                          child: Obx(() => Text(profileController.phone.value,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.w400,
                              )))),
                    ]),
              )),
          const SizedBox(height: 20.0),
          Container(
              child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ),
                    top: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Colors.black12,
                      size: 40,
                    ),
                    const SizedBox(width: 17.0),
                    Container(
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios,
                        size: 17, color: Color(0xFF5F5F5F))
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ),
                    // top: BorderSide(
                    //   color: Colors.black12,
                    //   width: 1.0,
                    // ),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black12,
                      size: 40,
                    ),
                    const SizedBox(width: 17.0),
                    Container(
                      child: const Text(
                        "Notification",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      child: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color(0xFF5F5F5F)),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0,
                    ),
                    // top: BorderSide(
                    //   color: Colors.black12,
                    //   width: 1.0,
                    // ),
                  ),
                ),
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.analytics,
                      color: Colors.black12,
                      size: 40,
                    ),
                    const SizedBox(width: 17.0),
                    Container(
                      child: const Text(
                        "Order’s Recapitulation",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      child: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color(0xFF5F5F5F)),
                    )
                  ],
                ),
              ),
            ],
          )),
          Spacer(),
          Container(
              padding: EdgeInsets.only(bottom: 120),
              child: GestureDetector(
                onTap: () {
                  // TODO: show modal to confirm logout
                  //Get.find<AuthController>().logout();
                  Get.offAll(() => LoginPage());
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Color(0xFFD13D34),
                    fontSize: 15,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
