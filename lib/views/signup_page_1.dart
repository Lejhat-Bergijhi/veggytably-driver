import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/controllers/auth_controller.dart';
import 'package:veggytably_driver/views/login_page.dart';
import 'package:veggytably_driver/widgets/input_text.dart';

class SignUpPage1 extends StatelessWidget {
  const SignUpPage1({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController licensePlateController = TextEditingController();
    final sw = MediaQuery.of(context).size.width;
    TextEditingController vehicleType = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(
                height: 8,
              ),
              // Text: Powered by Vegytably
              Text('Ready to Deliver Food Everywhere and Anywhere!',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 38),
              Column(
                children: [
                  Container(
                    width: 300,
                    child: InputTextField(
                      textEditingController: usernameController,
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 300,
                    child: InputTextField(
                      textEditingController: emailController,
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 300,
                    child: InputTextField(
                      textEditingController: phoneController,
                      hintText: 'Telephone Number',
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 300,
                    child: InputTextField(
                      textEditingController: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 300,
                    child: InputTextField(
                      textEditingController: vehicleType,
                      hintText: 'Vehicle Type',
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 300,
                    child: InputTextField(
                      textEditingController: licensePlateController,
                      hintText: 'License Plate',
                    ),
                  ),
                ],
              ),
              // Input Email or Telephone Number
              SizedBox(height: 12),

              // Continue button
              Container(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.instance.signUp(
                        usernameController,
                        emailController,
                        phoneController,
                        passwordController,
                        licensePlateController);
                    // Get.to(() => SignUpPage2(),
                    //     transition: Transition.fade);
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
                  width: sw,
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
                          Get.offAll(() => LoginPage(),
                              transition: Transition.fade);
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
      ),
    );
  }
}
