import 'package:flutter/material.dart';
import 'package:activeai/common_widget/health_button.dart';
import 'package:activeai/view/complete_profile/how_many_time.dart';
import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';

class HealthDetails extends StatefulWidget {
  const HealthDetails({Key? key});

  @override
  State<HealthDetails> createState() => _HealthDetailsState();
}

class _HealthDetailsState extends State<HealthDetails> {
  late Size media;
  Set<String> selectedHealth = {}; // Initialize selectedHealth as an empty set

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
                  value: 0.750,
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
                        "Share more health details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: media.width * 0.06),
                      const Text(
                        "This will help us create the right plans for you",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.5,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: media.width * 0.06),
                      const Text(
                        "You can select multiple options",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("None"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Obesity"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Diabetes"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Pre/Post Pregnancy"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("High Cholesterol/BP"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Thyroid Issues"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Knee/Joint Issues"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Slip Disc"),
                      SizedBox(height: media.width * 0.06),
                      _buildHealthButton("Other health conditions"),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HowManyTimes()),
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

  Widget _buildHealthButton(String title) {
    return Container(
      width: 308,
      height: 100,
      child: HealthButton(
        title: title,
        imagePath: selectedHealth.contains(title)
            ? "assets/img/yes_tick.png"
            : "assets/img/no_tick.png",
        isSelected: selectedHealth.contains(title),
        onPressed: () {
          setState(() {
            if (selectedHealth.contains(title)) {
              selectedHealth.remove(title);
            } else {
              selectedHealth.add(title);
            }
          });
        },
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
