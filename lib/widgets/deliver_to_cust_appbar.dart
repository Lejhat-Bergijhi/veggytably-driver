import 'package:flutter/material.dart';

class DeliverToCustAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const DeliverToCustAppbar({super.key})
      : preferredSize = const Size.fromHeight(171.0);

  Widget build(BuildContext context) {
    return Container(
        //transparent
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19),
          child: Text(
            "Heading To The Restaurant",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff356631),
              fontSize: 17,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
