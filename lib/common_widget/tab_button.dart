import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart'; // Adjust the import path as needed

class TabButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const TabButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color activeColor = Colors.blue;
    Color inactiveColor = TColor.white;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              )
            : null,
        padding: isActive
            ? const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0)
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 22,
              height: 22,
              fit: BoxFit.fitWidth,
              color: isActive ? Colors.white : inactiveColor,
            ),
            if (isActive)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
