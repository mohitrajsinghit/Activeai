import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String? imagePath;
  final VoidCallback onPressed;

  const GenderButton({
    Key? key,
    required this.title,
    required this.isSelected,
    this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.transparent;
    Color textColor = Colors.white;

    if (isSelected) {
      buttonColor = Colors.blue;
      textColor = Colors.white;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.white), // Add border here
        ),
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              if (imagePath != null) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    imagePath!,
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
