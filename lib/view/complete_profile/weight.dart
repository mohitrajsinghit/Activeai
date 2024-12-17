import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/view/complete_profile/height.dart';
import 'package:activeai/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/common_widget/MySwitch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';


class ValueScroller extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const ValueScroller({
    Key? key,
    required this.value,
    required this.onChanged,
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
          widget.value.toStringAsFixed(0),
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
              itemCount: 98, // Change itemCount to 501 for range from 0 to 500
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
}

class Weight extends StatefulWidget {
  const Weight({Key? key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  double weightValue = 185; // Default weight value
  Future<void> writeToFile(double content) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/inputfile.txt';
    final file = File(filePath);
    String con=content.toString();
    // Write the file
    await file.writeAsString(
      con + '\t', 
      mode: FileMode.append,
    );
    print('File written successfully at $filePath');
  } catch (e) {
    print('Error occurred: $e');
  }
}

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/profile_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 65,
                  ), // Add space for the LinearProgressIndicator
                  LinearProgressIndicator(
                    value: 0.375,
                    backgroundColor: Colors.black.withOpacity(
                        0.5), // Set background color of the progress indicator
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue), // Set color of the progress bar
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 100, // Example height for the content
                        color: Colors.transparent, // Color for the content area
                        // Add your content here
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
                    0.0433, // Reduced height
                color: Colors.black, // Color for the curve
              ),
            ),
          ),
          Positioned(
            // Position the image in the middle of the screen with specified dimensions
            width: 73.01,
            height: 178.5,
            left: MediaQuery.of(context).size.width / 2 - 73.01 / 2,
            top: 70,
            child: Image.asset(
              "assets/img/weight.png",
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
                    "How much do you\n weigh?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: media.width * 0.1),
                  MySwitch(
                    // Using MySwitch widget here
                    firstOptionText: "LBS",
                    secondOptionText: "KG",
                    onChanged: (int value) {
                      setState(() {
                        if (value == 0) {
                          // LBS is selected
                          weightValue = 185; // Set the default value for LBS
                        } else {
                          // KG is selected
                          weightValue = 83; // Set the default value for KG
                        }
                      });
                    },
                  ),
                  SizedBox(height: media.width * 0.06),
                  ValueScroller(
                    // Using ValueScroller widget here
                    value: weightValue,
                    onChanged: (value) {
                      setState(() {
                        weightValue = value;
                      });
                    },
                  ),
                  SizedBox(height: media.width * 0.07),
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
                  SizedBox(height: media.width * 0.08),
                  Container(
                    height: 60,
                    child: RoundButton(
                      title: "Continue",
                      onPressed: () {
                        // Add your onPressed logic here
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Height()),
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
