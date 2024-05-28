import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/gender_button.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/view/complete_profile/dob.dart';
import 'package:flutter/material.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key});

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  late Size media;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF141414),
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
                    height: 75,
                  ),
                  LinearProgressIndicator(
                    value: 0.125,
                    backgroundColor: Color.fromRGBO(36, 35, 35, 1),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      TColor.primaryColor1,
                    ),
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
                height: media.height * 0.0433,
                color: TColor.black,
              ),
            ),
          ),
          Positioned(
            top: 82,
            left: media.width / 2 - 73.01 / 2,
            child: Image.asset(
              "assets/img/male_female.png",
              width: 73.01,
              height: 178.5,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "What is your gender?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: media.width * 0.07),
                  Container(
                    width: 308,
                    height: 80,
                    child: GenderButton(
                      title: "Male",
                      imagePath: "assets/img/male.png",
                      isSelected: selectedGender == "Male",
                      onPressed: () {
                        setState(() {
                          selectedGender = "Male";
                        });
                      },
                    ),
                  ),
                  SizedBox(height: media.width * 0.06),
                  Container(
                    width: 308,
                    height: 80,
                    child: GenderButton(
                      title: "Female",
                      imagePath: "assets/img/female.png",
                      isSelected: selectedGender == "Female",
                      onPressed: () {
                        setState(() {
                          selectedGender = "Female";
                        });
                      },
                    ),
                  ),
                  SizedBox(height: media.width * 0.06),
                  Container(
                    width: 308,
                    height: 80,
                    child: GenderButton(
                      title: "Don't want to specify",
                      isSelected: selectedGender == null,
                      onPressed: () {
                        setState(() {
                          selectedGender = null;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: media.width * 0.07),
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
                          MaterialPageRoute(builder: (context) => DOB()),
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
