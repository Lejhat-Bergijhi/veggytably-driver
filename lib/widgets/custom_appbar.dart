import 'package:flutter/material.dart';
import 'package:veggytably_driver/utils/socket_service.dart';
import 'custom_switch.dart';

class CustomFloatingAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool offline;
  final String title;
  final String subTitle;
  final Color color;
  @override
  final Size preferredSize;
  final Function() toggleOnline;

  const CustomFloatingAppbar({
    super.key,
    required this.offline,
    required this.title,
    required this.subTitle,
    required this.color,
    required this.toggleOnline,
  }) : preferredSize = const Size.fromHeight(171.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        //transparent
        color: Colors.transparent,
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: offline ? Colors.white : const Color(0xff356631),
                      fontSize: 17,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: offline ? Colors.white : Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              //cupertino switch
              const Spacer(),

              CustomSwitch(
                value: offline,
                onChanged: (bool val) {
                  toggleOnline();
                  // connect to socket
                  if (!val) {
                    SocketService().connect();
                  } else {
                    SocketService().disconnect();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
