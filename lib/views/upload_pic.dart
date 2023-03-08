import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggytably_driver/views/landing_page.dart';

import 'home_page.dart';

class UploadPic extends StatefulWidget {
  const UploadPic({super.key});

  @override
  State<UploadPic> createState() => _UploadPicState();
}

class _UploadPicState extends State<UploadPic> {
  late XFile _imageFile;
  final ImagePicker picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) return;
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: TextButton(
              onPressed: () {
                Get.offAll(
                  () => LandingPage(),
                  transition: Transition.rightToLeftWithFade,
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Color.fromARGB(255, 147, 146, 146),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 70),
            Text(
              "Welcome!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: "Rubik",
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text: VegyMerch
            SizedBox(height: 8),
            Text(
              "Ready to Deliver Food Everywhere and Anywhere!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 42),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Profile Image",
                style: TextStyle(
                  color: Color(0xff242424),
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width - 40 * 2,
              child: DottedBorder(
                dashPattern: [8, 8],
                radius: Radius.circular(8),
                child: Container(
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // Profile Image preview
                          Icon(
                            Icons.image_outlined,
                            size: 150,
                          ),
                          SizedBox(height: 19),
                          Text(
                            "Upload from your device",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 19),
                          // Camera Button
                          Container(
                            width: MediaQuery.of(context).size.width -
                                40 * 2 -
                                23 * 2,
                            height: 36,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffefefef),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                takePhoto(ImageSource.camera);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  Container(
                                      width: 20,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        size: 20,
                                      )),
                                  SizedBox(width: 10),
                                  Text(
                                    "Camera",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 1),
                          Container(
                              width: MediaQuery.of(context).size.width -
                                  40 * 2 -
                                  23 * 2,
                              height: 36,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffefefef),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  takePhoto(ImageSource.gallery);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Container(
                                        width: 22,
                                        height: 15,
                                        child: Icon(
                                          Icons.photo_library,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          size: 20,
                                        )),
                                    SizedBox(width: 10),
                                    Text(
                                      "Gallery",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              )),
                          SizedBox(height: 24),
                        ])),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            // Login button
            Container(
              width: MediaQuery.of(context).size.width - 40 * 2,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // emailController.clear();
                  // passwordController.clear();
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff70cb88),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Text: Don't have an account?
            SizedBox(
                width: MediaQuery.of(context).size.width - 40 * 2,
                height: 21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.offAll(() => SignUpPage(), transition: Transition.fade);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff356631),
                          //underline
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 5),

            // Text: Sign Up
          ]),
        ),
      ),
    );
  }
}
