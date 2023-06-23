import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

abstract class StyleApp {

  static  var style1 = GoogleFonts.tajawal(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: HexColor("#CECECE"));
  static  var style2 = GoogleFonts.tajawal(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: HexColor("#545454"));
  static  var styleBestSellers= GoogleFonts.tajawal(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: HexColor("#005E8A"));
  static  var styleLogo = GoogleFonts.tajawal(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: HexColor("#D6212E"));
  static  var styprice = GoogleFonts.tajawal(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: HexColor("#D8282D"));
}
