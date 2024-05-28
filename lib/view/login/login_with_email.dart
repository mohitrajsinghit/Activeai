import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/common_widget/round_button_black.dart';
import 'package:activeai/common_widget/round_textfield.dart';
import 'package:activeai/view/login/login_with_mobile.dart';
import 'package:activeai/view/login/otp_email.dart';
import 'package:flutter/material.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final _email = TextEditingController();
  bool isCheck = false;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF141414),
      body: SingleChildScrollView(
        child: SizedBox(
          height: media
              .height, // Set the height of the SizedBox to match the available height
          child: PageView.builder(
            controller: PageController(),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox(
                width: media.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/img/signup1.png", // add the file extension
                      width: media.width,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: media.width * 0.03),
                    const Text(
                      "Sign in or Sign up",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: media.width * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          RoundTextField(
                            hitText: "Enter your email address",
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isCheck = !isCheck;
                                  });
                                },
                                icon: Icon(
                                  isCheck
                                      ? Icons.check_box_outlined
                                      : Icons.check_box_outline_blank_outlined,
                                  color: TColor.white,
                                  size: 20,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "I agree to ActiveAI ",
                                  style: TextStyle(
                                    color: TColor.white,
                                    fontFamily: "Roboto",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Terms of Service & Privacy Policy",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontFamily: "Roboto",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 360,
                            height: 63,
                            child: RoundButton(
                              title: "Send OTP",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OTPEmail()),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: media.width * 0.02),
                          const Text(
                            "or",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: media.width * 0.03),
                          Container(
                            width: 360,
                            height: 63,
                            child: RoundButtonBlack(
                              title: "Continue with Mobile",
                              imagePath: "assets/img/telephone.png",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginWithMobile()),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: media.width * 0.03),
                          Container(
                            width: 360,
                            height: 63,
                            child: RoundButtonBlack(
                              title: "Continue with Google",
                              imagePath: "assets/img/google.png",
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => OnBoardingView()),
                                // );
                              },
                            ),
                          ),
                          SizedBox(height: media.width * 0.03),
                          Container(
                            width: 360,
                            height: 63,
                            child: RoundButtonBlack(
                              title: "Continue with Apple",
                              imagePath: "assets/img/apple.png",
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => OnBoardingView()),
                                // );
                              },
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          const Text(
                            "You can do this later",
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey,
                              fontFamily: "Roboto",
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
