import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/widgets/input_text.dart';

class SignUpPage2 extends StatelessWidget {
  const SignUpPage2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 75),

            // Text: VegyMerch
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8,),

            // Text: Powered by Vegytably
            Text('Ready to Deliver Food Everywhere and Anywhere!',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 40),

            Text('Profile Image',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 7),

            const Icon(
              Icons.image_outlined,
              size: 200,
            ),
            SizedBox(height: 7),

            Text('Upload from your device',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 7),
           
            Container(
              padding: const EdgeInsets.only(
                  left: 130.0, right: 90.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: Color.fromARGB(217, 0, 0, 0),
                    size: 20,
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    child: const Text(
                      "Camera",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  left: 130.0, right: 90.0, top: 10, bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.cloud_download_outlined,
                    color: Color.fromARGB(217, 0, 0, 0),
                    size: 20,
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    child: const Text(
                      "Gallery",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            
            

            // Login button
            Container(
              width: 300,
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
                width: 219,
                height: 21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(
                    "Already have an account?",
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
                ],)
            ),
            SizedBox(height: 5),

            // Text: Sign Up
           
          ]),
        ),
      ),
    );
  }
}
