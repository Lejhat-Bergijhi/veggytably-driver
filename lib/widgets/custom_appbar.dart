import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_switch.dart';


class customFloatingAppbar extends StatelessWidget with PreferredSizeWidget {
    bool offline;
    final String title;
    final String subTitle;
    final Color color;
    @override
    final Size preferredSize;

    customFloatingAppbar(
      this.offline,
      this.title,
      this.subTitle,
      this.color,
    ): preferredSize = Size.fromHeight(171.0);

    Widget build(BuildContext context) {
      return Container(
        //transparent
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xfff9f9f9),

          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                          Text(
                             title,
                              style: TextStyle(
                                  color: Color(0xff356631),
                                  fontSize: 17,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.bold,
                              ),
                          ),
                         
                          Text(
                              subTitle,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                              ),
                          ),
                      ],
                  ),
                  //cupertino switch
                  const Spacer(),
                  
                  Container(
                      
                      child: CustomSwitch(
                          value: offline,
                          onChanged: (bool val) {
                            offline=!offline;
                          },
                      ),
                  ),
                  
              ],
          ),
        )
      );
    }
 }