import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff0049B0);

  static final primaryColorLight = Color(0xff0049B0).withOpacity(0.5);

  static final splashGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff0049B0),
      Color(0xff0049B0).withOpacity(0.8),
    ],
  );
}
