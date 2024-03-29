import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool? obscureText;

  const InputTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //hint text color

      controller: textEditingController,
      decoration: InputDecoration(
        //outline color
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff6f7fb), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color(0xfff6f7fb).withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff9f9f9f),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class InputTextField2 extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool? obscureText;

  const InputTextField2({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //hint text color

      controller: textEditingController,
      decoration: InputDecoration(
        //outline color
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff70CB88), width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Color(0xfff6f7fb).withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xffC4C4C4),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
