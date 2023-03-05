import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';


class UploadPic extends StatelessWidget {
  const UploadPic({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 120),
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
                children: [
                  
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              
              width: MediaQuery.of(context).size.width-40*2,
              child: DottedBorder(
                dashPattern:[8,8],
                radius: Radius.circular(8),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      SizedBox(height: 20,),
                      Container(
                        
                          width: 130,
                          height: 104,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xffd1d1d6),
                          ),
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
                      Container(
                        
                        width: MediaQuery.of(context).size.width-40*2-23*2,
                        height: 36,
                        child: 
                        ElevatedButton(
                           style: ElevatedButton.styleFrom(
                              primary: Color(0xffefefef),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                ),
                                
                              ),
                            ),
                          onPressed: () {},

                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
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
                                      )
                                  ),
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
                        width: MediaQuery.of(context).size.width-40*2-23*2,
                        height: 36,
                        
                        child:
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffefefef),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                ),
                                
                              ),
                            ),
                          onPressed: (){

                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Spacer(),
                                  Container(
                                      width: 22,
                                      height: 15,
                                       child: Icon(
                                          Icons.photo_library,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          size: 20,
                                      )
                                  ),
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
                        )
                      ),
                      SizedBox(height: 24),
              
                    ]
                  )
                ),
              ),
            ),
            SizedBox(height: 8,),
            // Login button
            Container(
              width: MediaQuery.of(context).size.width-40*2,
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
                width: MediaQuery.of(context).size.width-40*2,
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
