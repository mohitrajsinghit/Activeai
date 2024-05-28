import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/common_widget/round_button_black.dart';
import 'package:activeai/view/login/login_with_email.dart';
import 'package:activeai/view/login/otp_mobile.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginWithMobile extends StatefulWidget {
  const LoginWithMobile({Key? key}) : super(key: key);

  @override
  State<LoginWithMobile> createState() => _LoginWithMobileState();
}

class _LoginWithMobileState extends State<LoginWithMobile> {
  final TextEditingController _mobile = TextEditingController();
  bool isCheck = false;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    _mobile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF141414),
      body: SingleChildScrollView(
        child: SizedBox(
          width: media.width,
          height: media.height,
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
                    // RoundPhoneField(
                    //   hitText: "Enter your mobile number",
                    //   controller: _mobile,
                    // ),

                    IntlPhoneField(
                      focusNode: focusNode,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      languageCode: "en",
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                      onCountryChanged: (country) {
                        print('Country changed to: ' + country.name);
                      },
                    ),

                    SizedBox(height: media.width * 0.02),
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
                                  decorationColor: Colors.blue,
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
                                builder: (context) => OTPMobile()),
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
                        title: "Continue with Email",
                        imagePath: "assets/img/email.png",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginWithEmail()),
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
                    SizedBox(height: media.width * 0.05),
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
        ),
      ),
    );
  }
}
