import 'package:flutter/material.dart';
import 'package:activeai/view/complete_profile/what_is_your_goal.dart';
import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';

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

class HowManyTimes extends StatefulWidget {
  const HowManyTimes({Key? key}) : super(key: key);

  @override
  State<HowManyTimes> createState() => _HowManyTimesState();
}

class _HowManyTimesState extends State<HowManyTimes> {
  late Size media;
  String? selectedFrequency; // Initialize selectedFrequency as null

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 14, 14),
      appBar: AppBar(
        backgroundColor: TColor.black,
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.0433,
                color: Colors.black,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 75),
                LinearProgressIndicator(
                  value: 0.875,
                  backgroundColor: Color.fromRGBO(36, 35, 35, 1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    TColor.primaryColor1,
                  ),
                ),
                SizedBox(height: media.width * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "How many times do you\n workout?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: media.width * 0.06),
                      _buildFrequencyButton("I don't", "assets/img/no_gym.png"),
                      SizedBox(height: media.width * 0.06),
                      _buildFrequencyButton(
                          "1-3 times in a week", "assets/img/walk.png"),
                      SizedBox(height: media.width * 0.06),
                      _buildFrequencyButton(
                          "3-5 times in a week", "assets/img/jogging.png"),
                      SizedBox(height: media.width * 0.06),
                      _buildFrequencyButton(
                          "6-7 times in a week", "assets/img/biceps.png"),
                      SizedBox(height: media.width * 0.06),
                      _buildFrequencyButton("More than 7 times in a week",
                          "assets/img/wt_lifting.png"),
                      SizedBox(height: media.width * 0.06),
                      const Text(
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
                      SizedBox(height: media.width * 0.06),
                      Container(
                        height: 60,
                        child: RoundButton(
                          title: "Continue",
                          onPressed: () {
                            // Add your onPressed logic here
                            // Navigate to the next page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WhatIsYourGoal()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                          height: 20), // Add some extra space at the bottom
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrequencyButton(String frequency, String imagePath) {
    return SizedBox(
      height: 100,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedFrequency = frequency;
          });
        },
        borderRadius: BorderRadius.circular(25), // Add border radius to InkWell
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(25), // Add border radius to the container
            border: Border.all(
              color: selectedFrequency == frequency
                  ? Colors.white
                  : Colors
                      .transparent, // Change border color based on selection
              width: 2, // Border width
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                TColor.primaryColor1,
                Colors.black,
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 15), // Add left padding to text
                  child: Text(
                    frequency,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 15), // Add right padding to image
                child: Image.asset(
                  imagePath,
                  width: 45,
                  height: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
