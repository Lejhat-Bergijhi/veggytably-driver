import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:veggytably_driver/controllers/auth_controller.dart';
import 'package:veggytably_driver/widgets/input_text.dart';
import '../utils/api.endpoints.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(height: 240),

              Obx(() {
                if (AuthController.to.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return Container();
                }
              }),
              // baseurl
              Text(ApiEndPoints.baseUrl),

              // Text: VegyMerch
              Text(
                'VeggyDriver',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),

              // Text: Powered by Vegytably
              Text('Powered by Veggytably',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 42),

              Form(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: InputTextField(
                        textEditingController: emailController,
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      width: 300,
                      child: InputTextField(
                        textEditingController: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              // Input Email or Telephone Number
              SizedBox(height: 16),

              // Login Submit button
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    AuthController.to.login(
                      emailController,
                      passwordController,
                    );
                  },
                  child: Text(
                    'Login',
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
                        "New user? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to Sign Up Page
                          Get.offAll(() => SignUpPage(),
                              transition: Transition.fade);
                        },
                        child: Text(
                          'Sign Up',
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
