import 'package:activeai/common/colo_extension.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final String firstOptionText;
  final String secondOptionText;
  final ValueChanged<int> onChanged;

  const MySwitch({
    Key? key,
    required this.firstOptionText,
    required this.secondOptionText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  double xAlign = -1; // Default alignment is for first option
  Color firstOptionColor = Colors.white; // Default text color for first option
  Color secondOptionColor = Colors.blue; // Default text color for second option

  @override
  Widget build(BuildContext context) {
    final width = 186.0; // Adjust width here
    final height = 39.0; // Adjust height here

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: TColor.white, // Fixed background color
        borderRadius: BorderRadius.all(
          Radius.circular(20.0), // Adjust border radius
        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: Duration(milliseconds: 300),
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: BoxDecoration(
                color: TColor.primaryColor1, // Background color behind text
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0), // Adjust border radius
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = -1;
                firstOptionColor = Colors.white; // Text color change
                secondOptionColor = Colors.black; // Text color change
                widget.onChanged(0);
              });
            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                height: height,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.firstOptionText,
                  style: TextStyle(
                    color: firstOptionColor, // Use firstOptionColor
                    fontFamily: "Roboto",
                    fontSize: 20 , // Adjust font size
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                xAlign = 1;
                secondOptionColor = Colors.white; // Text color change
                firstOptionColor = Colors.black; // Text color change
                widget.onChanged(1);
              });
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                height: height,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  widget.secondOptionText,
                  style: TextStyle(
                    color: secondOptionColor, // Use secondOptionColor
                    fontFamily: "Roboto",
                    fontSize: 20, // Adjust font size
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
