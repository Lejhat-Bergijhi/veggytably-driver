import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OfflineBody extends StatelessWidget {
  const OfflineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset("assets/images/image2.png"),
          SizedBox(
            height: 29,
          ),
          Text(
            "YOU ARE IN THE OFFLINE MODE!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily: "Rubik",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
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
    );
  }
}
