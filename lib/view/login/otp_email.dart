import 'package:activeai/common/colo_extension.dart';
import 'package:activeai/common_widget/round_button.dart';
import 'package:activeai/view/complete_profile/choose_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPEmail extends StatefulWidget {
  const OTPEmail({Key? key}) : super(key: key);

  @override
  _OTPEmailState createState() => _OTPEmailState();
}

class _OTPEmailState extends State<OTPEmail> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _areAllFieldsFilled() {
    for (var controller in _otpControllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            'Please fill the OTP correctly.',
            style: TextStyle(color: Colors.red),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: media.width * 0.15),
            Text(
              "Verify your email address",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontFamily: 'Roboto', 
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: media.width * 0.02),
            Text(
              "Enter the OTP sent to abjackson@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: media.width * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 62,
                    height: 73,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextField(
                      controller: _otpControllers[i],
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        counterText: '', // Hide the character count
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
              ],
            ),
            SizedBox(height: media.width * 0.13),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: TextButton(
                onPressed: () {
                  // Add the logic for resending the OTP here
                },
                child: const Text(
                  "Resend code",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey,
                    color: Colors.grey,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
            SizedBox(height: media.width * 0.3),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Container(
                width: 360,
                height: 63,
                child: RoundButton(
                  title: "Verify",
                  onPressed: () {
                    if (_areAllFieldsFilled()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChooseGender()),
                      );
                    } else {
                      _showErrorDialog(context);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
