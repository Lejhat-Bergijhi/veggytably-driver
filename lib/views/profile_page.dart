import 'package:flutter/material.dart';
import 'package:veggytably_driver/widgets/profile_menu.dart';

class ProfilePageDriver extends StatelessWidget {
  const ProfilePageDriver({super.key});

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //make spacing gone
        titleSpacing: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: "Rubik",
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Column( //
        children: [
          
          const SizedBox(height: 20.0),
          Container(
            height: 205,
            padding: const EdgeInsets.only(left:78, right: 78),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    color: Colors.black,
                    Icons.account_circle_rounded,
                    size: 70,
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    // ignore: prefer_const_constructors

                    

                    child: Text(
                      "Nandarelle Aurora Trevor 'Ndut' Siahaan",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w600,
                          
                      ),
                      textAlign: TextAlign.center
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Container(
                    child: Text(
                      "+62 89101112131",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w400,
                      ),
                    )
                  ),
                ]
              ),
            )
          ),
          const SizedBox(height: 20.0),
          Container(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                ProfileMenu(Icons.edit, "Edit Profile"),
                ProfileMenu(Icons.notifications, "Notification"),
                ProfileMenu(Icons.settings, "Settings"),
              ],
            )
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.only(bottom:50),
            child: Text(
              "Log Out",
              style: TextStyle(
                color: Color(0xFFD13D34),
                fontSize: 15,
                fontFamily: "Rubik",
                fontWeight: FontWeight.w400,
              ),
            )
          ),

        ],
      )
    );
  }
}