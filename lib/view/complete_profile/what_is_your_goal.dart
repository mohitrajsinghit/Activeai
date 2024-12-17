import 'package:activeai/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';

class WhatIsYourGoal extends StatefulWidget {
  const WhatIsYourGoal({Key? key}) : super(key: key);

  @override
  State<WhatIsYourGoal> createState() => _WhatIsYourGoalState();
}

class _WhatIsYourGoalState extends State<WhatIsYourGoal> {
  late Size media;
  String? selectedGoal;

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
                  value: 1,
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
                        "What is your goal?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: media.width * 0.01),
                      const Text(
                        "Select any one and proceed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w200,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: media.width * 0.1),
                      GoalCard(
                        imagePath: "assets/img/lose_wt.png",
                        text: 'Lose Weight',
                        isSelected: selectedGoal == 'Lose Weight',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Lose Weight';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.05),
                      GoalCard(
                        imagePath: "assets/img/gain_wt.png",
                        text: 'Gain Weight',
                        isSelected: selectedGoal == 'Gain Weight',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Gain Weight';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.05),
                      GoalCard(
                        imagePath: "assets/img/coach.png",
                        text: 'Coach Guidance',
                        isSelected: selectedGoal == 'Coach Guidance',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Coach Guidance';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.06),
                      GoalCard(
                        imagePath: "assets/img/gain_muscle.png",
                        text: 'Gain Muscle',
                        isSelected: selectedGoal == 'Gain Muscle',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Gain Muscle';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.06),
                      GoalCard(
                        imagePath: "assets/img/stamina.png",
                        text: 'Stamina &\nMobility',
                        bottomPadding: 38,
                        isSelected: selectedGoal == 'Stamina &\nMobility',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Stamina &\nMobility';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.05),
                      GoalCard(
                        imagePath: "assets/img/strength.png",
                        text: 'Strength &\nConditioning',
                        bottomPadding: 38,
                        isSelected: selectedGoal == 'Strength &\nConditioning',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Strength &\nConditioning';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.05),
                      GoalCard(
                        imagePath: "assets/img/lifestyle.png",
                        text: 'Lifestyle\nManagement',
                        bottomPadding: 38,
                        isSelected: selectedGoal == 'Lifestyle\nManagement',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Lifestyle\nManagement';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.06),
                      GoalCard(
                        imagePath: "assets/img/injury.png",
                        text: 'Injury Rehab',
                        isSelected: selectedGoal == 'Injury Rehab',
                        onTap: () {
                          setState(() {
                            selectedGoal = 'Injury Rehab';
                          });
                        },
                      ),
                      SizedBox(height: media.width * 0.06),
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
                      SizedBox(height: media.width * 0.06),
                      Container(
                        height: 60,
                        child: RoundButton(
                          title: "Continue",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainTabView()),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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

class GoalCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final double bottomPadding;
  final bool isSelected;
  final VoidCallback onTap;

  const GoalCard({
    required this.imagePath,
    required this.text,
    this.bottomPadding = 51.0, // Default value is 51.0
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: bottomPadding,
            left: 38,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                backgroundColor: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
