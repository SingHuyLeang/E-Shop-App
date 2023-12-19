import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight({required double height}) {
  double screenHeight = SizeConfig.screenHeight;
  // 812.0 is layout height that designer use
  return (height / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidht({required double width}) {
  double screenWidth = SizeConfig.screenWidth;
  // 375.0 is layout height that designer use
  return (width / 375.0) * screenWidth;
}

double getFontSize({required double width}) {
  double screenWidth = SizeConfig.screenWidth;
  // 375.0 is layout height that designer use
  return (width / 375.0) * screenWidth;
}