import 'package:activeai/view/complete_profile/food_preference.dart';
import 'package:activeai/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/common_widget/MySwitch.dart';

class ValueScroller extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final bool isCm; // Added boolean to determine the unit

  const ValueScroller({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isCm = true, // Default unit is cm
  }) : super(key: key);

  @override
  _ValueScrollerState createState() => _ValueScrollerState();
}

class _ValueScrollerState extends State<ValueScroller> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${_heightText(widget.value, widget.isCm)}',
          style: TextStyle(
            color: TColor.white,
            fontSize: 35,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10), // Add spacing between lines and text
        Container(
          height: 100,
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                final newValue = _controller.offset;
                if (newValue != widget.value) {
                  widget.onChanged(newValue);
                }
              }
              return false;
            },
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: 80, //_maxValue + 1, // Total inches from 0'0" to 15'0"
              itemBuilder: (context, index) {
                return Container(
                  width: index.isEven
                      ? 15
                      : 2.58, // Set different widths for transparent and white lines
                  height: 100,
                  color: index.isEven ? Colors.transparent : Colors.white,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _heightText(double value, bool isCm) {
    if (isCm) {
      return '${value.round()} cm';
    } else {
      int feet = value ~/ 12;
      int inches = value.toInt() % 12;
      return '$feet\'${inches.toString().padLeft(2, '0')}\"';
    }
  }
}

class Height extends StatefulWidget {
  const Height({Key? key});

  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  double heightValue = 185; // Default height value
  bool isCm = true; // Added boolean to track unit

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/profile_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 65,
                  ), 
                  LinearProgressIndicator(
                    value: 0.500,
                    backgroundColor: Colors.black.withOpacity(
                        0.5), 
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue), 
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.transparent, 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height *
                    0.0433, 
                color: Colors.black, 
              ),
            ),
          ),
          Positioned(
           
            width: 73.01,
            height: 178.5,
            left: MediaQuery.of(context).size.width / 2 - 73.01 / 2,
            top: 70,
            child: Image.asset(
              "assets/img/height.png",
              width: 73.01,
              height: 178.5,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "What is your height?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: media.width * 0.13),
                  MySwitch(
                    // Using MySwitch widget here
                    firstOptionText: "CM",
                    secondOptionText: "FT",
                    onChanged: (int value) {
                      setState(() {
                        isCm = value == 0; // Update unit
                        if (!isCm) {
                          // FT is selected
                          // Convert 185 cm to feet and inches
                          heightValue = 0; // Reset value for FT
                        } else {
                          // CM is selected
                          heightValue = 185; // Set the default value for CM
                        }
                      });
                    },
                  ),
                  SizedBox(height: media.width * 0.08),
                  ValueScroller(
                    // Using ValueScroller widget here
                    value: heightValue,
                    onChanged: (value) {
                      setState(() {
                        heightValue = value;
                      });
                    },
                    isCm: isCm, // Pass unit information to the widget
                  ),
                  SizedBox(height: media.width * 0.09),
                                         InkWell(
                    onTap: () {
                      // Add your navigation logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainTabView()), // Replace `PageName` with your actual page widget
                      );
                    },
                    child: Text(
                      "You can do this later",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.grey,
                        fontFamily: "Roboto",
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: media.width * 0.1),
                  Container(
                    height: 60,
                    child: RoundButton(
                      title: "Continue",
                      onPressed: () {
                        // Add your onPressed logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodPreference()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);
    path.quadraticBezierTo(
      w * 0.5,
      h - 75,
      w,
      h,
    );
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
