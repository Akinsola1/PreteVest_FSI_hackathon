import 'package:flutter/material.dart';
import 'package:pretevest/ui/theme/colors.dart';

class AppFonts {
  static const blueHeader = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 20,
      fontFamily: 'openSansMedium',
      fontWeight: FontWeight.w600);

  static const bodyBlack = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontFamily: 'openSansLight',
      fontWeight: FontWeight.w600);

  static const bodyBlue = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontFamily: 'openSansLight',
      fontWeight: FontWeight.w600);

  static const bodyWhite = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontFamily: 'openSansLight',
      fontWeight: FontWeight.w600);

  static final hintText = TextStyle(
      color: Colors.black.withOpacity(.5),
      fontSize: 16,
      fontFamily: 'openSansLight',
      fontWeight: FontWeight.w400);
  static const tinyBlack = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontFamily: 'openSansLight',
      fontWeight: FontWeight.w400);
  static const tinyBlue = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14,
      fontFamily: 'openSansLight',
      fontWeight: FontWeight.w400);
}
