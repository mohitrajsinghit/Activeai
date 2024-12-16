import 'package:flutter/material.dart';
import '../common/colo_extension.dart';

enum RoundButtonType { bgGradient, bgSGradient, textGradient }

class RoundButtonBlack extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final String? imagePath; // Change to String
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const RoundButtonBlack({
    Key? key,
    required this.title,
    this.type = RoundButtonType.bgGradient,
    this.imagePath, // Change to String
    this.fontSize = 18,
    this.elevation = 1,
    this.fontWeight = FontWeight.w700,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color textColor;

    // Set colors based on button type
    switch (type) {
      case RoundButtonType.bgGradient:
        buttonColor = TColor.black;
        textColor = Colors.white;
        break;
      case RoundButtonType.bgSGradient:
        buttonColor = TColor.black;
        textColor = Colors.white;
        break;
      case RoundButtonType.textGradient:
        buttonColor = Colors.transparent;
        textColor = TColor.primaryColor1;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: buttonColor,
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
          borderRadius: BorderRadius.circular(100),
        ),
        textColor: textColor,
        minWidth: double.maxFinite,
        elevation: type == RoundButtonType.bgGradient ||
                type == RoundButtonType.bgSGradient
            ? 0
            : elevation,
        color: type == RoundButtonType.textGradient
            ? Colors.transparent
            : buttonColor,
        child: Row(
          children: [
            if (imagePath != null) // Add image only if it's provided
              Padding(
                padding: const EdgeInsets.only(left: 12), // Adjust padding here
                child: Image.asset(
                  imagePath!,
                  width: 24,
                  height: 24,
                ),
              ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
