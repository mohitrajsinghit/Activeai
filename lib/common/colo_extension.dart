import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => Color.fromRGBO(4, 108, 198, 1);
  static Color get primaryColor2 => const Color(0xff9DCEFF);
  static Color get secondaryColor1 => const Color(0xffC58BF2);
  static Color get secondaryColor2 => const Color(0xffEEA4CE);

  static List<Color> get primaryG => [primaryColor2, primaryColor1];
  static List<Color> get secondaryG => [secondaryColor2, secondaryColor1];

  static Color get black => Color.fromARGB(255, 0, 0, 0);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);

  // static Color get black => Colors.black;
  // static Color get white => Colors.white;
}
