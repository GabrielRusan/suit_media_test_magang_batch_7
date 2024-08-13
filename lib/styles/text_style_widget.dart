import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suit_media_test_app/styles/color_style.dart';

class TextStyleWidget {
  static TextStyle btn(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.white,
        fontStyle: fontStyle,
        fontSize: 14,
        height: 1.31,
      ),
    );
  }

  static TextStyle snackbarTitle(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      fontSize: 16,
      height: 1.42,
      letterSpacing: 0.5,
    ));
  }

  static TextStyle snackBarMessage(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
        textStyle: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      fontSize: 11,
      height: 1.45,
      letterSpacing: 0.5,
    ));
  }

  static TextStyle h5(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? ColorStyle.dark,
        fontStyle: fontStyle,
        fontSize: 10,
        height: 0.93,
      ),
    );
  }

  static TextStyle h4(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? ColorStyle.dark,
        fontStyle: fontStyle,
        fontSize: 12,
        height: 2.25,
      ),
    );
  }

  static TextStyle h3(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? ColorStyle.dark,
        fontStyle: fontStyle,
        fontSize: 16,
        height: 1.5,
      ),
    );
  }

  static TextStyle h2(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? ColorStyle.dark,
        fontStyle: fontStyle,
        fontSize: 18,
        height: 1.68,
      ),
    );
  }

  static TextStyle h1(
      {Color? color, FontWeight? fontWeight, FontStyle? fontStyle}) {
    return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? ColorStyle.dark,
        fontStyle: fontStyle,
        fontSize: 24,
        height: 2.25,
      ),
    );
  }
}
