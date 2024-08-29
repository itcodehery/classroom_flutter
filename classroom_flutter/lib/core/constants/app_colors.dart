import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 197, 237, 54);
  static const Color secondaryColor = Color(0xFF303F9F);
  static const Color accentColor = Color(0xFF448AFF);
  static const Color errorColor = Color(0xFFB00020);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFAB00);

  static const Map<String, List<Color>> gradientColors = {
    'blue': [
      Color.fromARGB(255, 61, 76, 162),
      Color.fromARGB(255, 36, 48, 128)
    ],
    'cyan': [
      Color.fromARGB(255, 67, 187, 173),
      Color.fromARGB(255, 15, 138, 138)
    ],
    'yellow': [
      Color.fromARGB(255, 212, 212, 68),
      Color.fromARGB(255, 171, 120, 0)
    ],
    'green': [Color.fromARGB(255, 0, 128, 0), Color.fromARGB(255, 15, 213, 15)],
  };
}
