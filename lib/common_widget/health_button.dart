import 'package:activeai/common/colo_extension.dart';
import 'package:flutter/material.dart';

class HealthButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String? imagePath;
  final VoidCallback onPressed;

  const HealthButton({
    Key? key,
    required this.title,
    this.isSelected = false,
    this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;
    String tickImage = "assets/img/no_tick.png"; // Default image

    if (isSelected) {
      textColor = Colors.white;
      tickImage = "assets/img/yes_tick.png"; // Selected image
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [TColor.primaryColor1, Colors.black],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            if (imagePath != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Image.asset(
                  tickImage,
                  width: 45,
                  height: 45,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

