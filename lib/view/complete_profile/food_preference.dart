import 'package:activeai/view/complete_profile/health_details.dart';
import 'package:activeai/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class FoodPreference extends StatefulWidget {
  const FoodPreference({Key? key});

  @override
  State<FoodPreference> createState() => _FoodPreferenceState();
}

class _FoodPreferenceState extends State<FoodPreference> {
  late Size media;
  String? selectedPreference;
    Future<void> writeToFile(String? content) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/inputfile.txt';
    final file = File(filePath);
    content=content.toString();
    // Write the file
    await file.writeAsString(
      content + '\t', 
      mode: FileMode.append,
    );
    print('File written successfully at $filePath');
  } catch (e) {
    print('Error occurred: $e');
  }
}

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
                    height: 60,
                  ),
                  LinearProgressIndicator(
                    value: 0.625,
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
            top: 90, // Center vertically
            left: (media.width - 105) / 2, // Center horizontally
            child: Image.asset(
              "assets/img/food.png",
              width: 100,
              height: 100,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "What's your\n food preference?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: media.width * 0.07),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.5,
                    children: [
                      _buildFoodPreferenceItem(
                        "assets/img/veg.png",
                        "Vegetarian",
                      ),
                      _buildFoodPreferenceItem(
                        "assets/img/nveg.png",
                        "Non Vegetarian",
                      ),
                      _buildFoodPreferenceItem(
                        "assets/img/egg.png",
                        "Eggetarian",
                      ),
                      _buildFoodPreferenceItem(
                        "assets/img/vegan.png",
                        "Vegan",
                      ),
                    ],
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
                              builder: (context) => const HealthDetails()),
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

  Widget _buildFoodPreferenceItem(String imagePath, String name) {
    bool isSelected = selectedPreference == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPreference = name;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? Color(0xFF27A6E7) : Colors.white,
          ),
          color: isSelected ? Color(0xFF27A6E7) : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 62,
              height: 62, // Adjusted height to make it consistent
              fit: BoxFit.contain,
            ),
            SizedBox(height: 6),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
