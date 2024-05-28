import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart';

class HowManyTimesButton extends StatefulWidget {
  final String title;
  final bool isSelected;
  final String imagePath; // Unique image path for each button
  final VoidCallback onPressed;

  const HowManyTimesButton({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  _HowManyTimesButtonState createState() => _HowManyTimesButtonState();
}

class _HowManyTimesButtonState extends State<HowManyTimesButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: widget.isSelected
              ? Border.all(
                  color: Colors.white, width: 2) // White border when selected
              : null,
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              TColor.primaryColor1, // Adjust gradient colors as needed
              Colors.black,
            ],
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12), // Image padding from the left
              child: Image.asset(
                widget.imagePath, // Use unique image path for each button
                width: 45,
                height: 45,
              ),
            ),
            SizedBox(width: 10), // Add some space between image and text
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
