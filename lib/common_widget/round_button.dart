import 'package:flutter/material.dart';
import '../common/colo_extension.dart';

enum RoundButtonType { bgGradient, bgSGradient, textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const RoundButton({
    Key? key, // fix key
    required this.title,
    this.type = RoundButtonType.bgGradient,
    this.fontSize = 16,
    this.elevation = 1,
    this.fontWeight = FontWeight.w700,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = type == RoundButtonType.bgSGradient
        ? TColor.primaryColor1
        : TColor.primaryColor1;

    return Container(
      decoration: BoxDecoration(
        color: buttonColor, // Just use one color for the background
        borderRadius: BorderRadius.circular(100),
        boxShadow: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 0.5,
                  offset: Offset(0, 0.5),
                ),
              ]
            : null,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        textColor: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Colors.white
            : TColor.primaryColor1,
        minWidth: double.maxFinite,
        elevation: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? 0
            : elevation,
        color: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? Colors.transparent
            : buttonColor, // Use buttonColor here as well
        child: Text(
          title,
          style: TextStyle(
            color: type == RoundButtonType.bgGradient ||
                    type == RoundButtonType.bgSGradient
                ? Colors.white
                : TColor.primaryColor1,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
