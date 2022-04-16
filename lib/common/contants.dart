import 'package:flutter/material.dart';
import 'package:g8te_pass/common/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

///color schemes
const COLOR_WHITE = Color(0xffF0F6FA);
const COLOR_GRAY = Color(0xffDCE9F6);
const COLOR_DARK_BLUE = Color(0xff442FB2);
const COLOR_DARK = Color(0xff0d1d50);
const COLOR_LIGHT_BLUE = Color(0xff4ED3F5);

const String dev_endpoint = "http://10.0.2.2:8000";

ThemeData createTheme(BuildContext context) {
  return ThemeData(
    // appBarTheme: appBarTheme,
    scaffoldBackgroundColor: COLOR_GRAY,
    primarySwatch: Colors.deepPurple,

    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: "Comic-bold",
        color: COLOR_DARK,
        fontWeight: FontWeight.w700,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.accent,
      colorScheme: Theme.of(context).colorScheme.copyWith(
        // secondary will be the textColor, when the textTheme is set to accent
      ),
    ),
  );
}