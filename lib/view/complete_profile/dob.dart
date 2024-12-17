import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/view/complete_profile/weight.dart';
import 'package:activeai/view/main_tab/main_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class DOB extends StatefulWidget {
  const DOB({Key? key});

  @override
  State<DOB> createState() => _DOBState();
}

class _DOBState extends State<DOB> {
  late Size media;
  String? selectedDate;
    Future<void> writeToFile(String? content) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/inputfile.txt';
    final file = File(filePath);
    content=content.toString();
    // Write the file
    await file.writeAsString(
      '\t'+content + '\t',
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
                    height: 75,
                  ),
                  LinearProgressIndicator(
                    value: 0.25,
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
            top: 70,
            left: media.width / 2 - 73.01 / 2,
            child: Image.asset(
              "assets/img/cake.png",
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
                    "How old are you?",
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
                    height: MediaQuery.of(context).copyWith().size.height /
                        3, // Reduces the height of the picker
                    child: CupertinoTheme(
                      data:const CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                            fontSize: 23,
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() {
                            // Do something with newDate
                          });
                        },
                      ),
                    ),
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
                          MaterialPageRoute(builder: (context) => Weight()),
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
