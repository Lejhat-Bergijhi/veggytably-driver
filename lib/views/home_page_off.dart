import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/widgets/custom_appbar.dart';




class HomePageOff extends StatelessWidget {
  const HomePageOff({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());
    return Scaffold(
      //background color white 
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        //appbar container
        appBar: customFloatingAppbar(true, 'Offline Mode', "You won't get any order", Color(0xff70cb88)),
        // extendBodyBehindAppBar: true,
        // extendBody: true,
        //image container
        body: Column(
          children: [
            Spacer(),
            Container(
                //image
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/image 2.png'),
                        fit: BoxFit.cover)),
                //text container
                
              ),
              SizedBox(height: 29,),
              Text(
                  "YOU ARE IN THE OFFLINE MODE!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                  ),
              ),
              SizedBox(height: 12,),
              Text(
                "Turn the switch on to start \naccepting orders!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                ),
              ),
              Spacer()
          ],
        ),
            bottomNavigationBar: Container(   
            height: 82.7,                                          
            decoration: BoxDecoration(                                                   
                borderRadius: BorderRadius.only(                                           
                topRight: Radius.circular(16), topLeft: Radius.circular(16)),            
                boxShadow: [                                                               
                BoxShadow(color: Color.fromRGBO(0,0,0,230), spreadRadius: 0, blurRadius: 20),       
                ],

            ),                                                                         
            child: ClipRRect( 
                                                                         
                borderRadius: BorderRadius.only(                                           
                    topLeft: Radius.circular(16.0),                                            
                    topRight: Radius.circular(16.0),                                           
                ),                                                                         
                child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
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
                    currentIndex: 1,
                    // onTap: _onItemTapped,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.black38,
                ),                                                                 
            )                                                                           
        )
    
        );
    }
 
}


