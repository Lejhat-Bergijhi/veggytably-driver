import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/widgets/input_text.dart';

class SignUpPage1 extends StatelessWidget {
  const SignUpPage1({super.key});

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
            SizedBox(height: 50),

            Column(
              children: [
                Container(
                  width: 300,
                  child: InputTextField(
                    emailController,
                    'Name',
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 300,
                  child: InputTextField(
                    emailController,
                    'Email',
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 300,
                  child: InputTextField(
                    passwordController,
                    'Telephone Number',
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 300,
                  child: InputTextField(
                    emailController,
                    'Password',
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 300,
                  child: InputTextField(
                    emailController,
                    'Licence Plate',
                  ),
                ),
              ],
            ),
            // Input Email or Telephone Number
            SizedBox(height: 12),

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
