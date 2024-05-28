import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final bool obscureText;
  final EdgeInsets? margin;

  const RoundTextField({
    Key? key,
    required this.hitText,
    this.controller,
    this.margin,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 366,
      height: 63,
      decoration: BoxDecoration(
        color: Colors.black, // Set background color to black
        borderRadius: BorderRadius.circular(100), // Set circular radius to 100
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white), // Set text color to white
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(40, 17, 24,
              15), // Add left padding to create space before hint text
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hitText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ), // Set hint text color to white and size to 18
        ),
      ),
    );
  }
}
