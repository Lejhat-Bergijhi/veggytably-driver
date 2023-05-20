import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Image img;
  final String name;
  final String rest;
  final String price;

  const FoodCard(this.img, this.name, this.rest, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 168,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.67),
        boxShadow: [
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 16,
            offset: Offset(0, 0),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 108,
            height: 102.67,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.67),
                topRight: Radius.circular(10.67),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: FlutterLogo(size: 102.66666412353516),
          ),
          SizedBox(height: 5.33),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                Text(
                  rest,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff9f9f9f),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.33),
          Text(
            price,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
