import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RoundPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String hitText;
  final EdgeInsets? margin;

  const RoundPhoneField({
    Key? key,
    required this.hitText,
    this.controller,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 366,
      height: 63,
      decoration: BoxDecoration(
        color: Colors.black, // Set background color to black
        borderRadius: BorderRadius.circular(100), // Set circular radius to 100
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: IntlPhoneField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hitText,
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            style: TextStyle(color: Colors.white), // Set text color to white
            initialCountryCode: 'IN', // Change to your default country code
            inputFormatters: [], // Empty list to disable character count
            onChanged: (phone) {
              // Add your onChanged logic here if needed
              print(phone.completeNumber);
            },
            onCountryChanged: (country) {
              // Add your onCountryChanged logic here if needed
              print('Country changed to: ' + country.name);
            },
          ),
        ),
      ),
    );
  }
}
