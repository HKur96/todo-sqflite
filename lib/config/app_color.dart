import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColor {
  static const lightBgColor = Color(0xffEEEEEE);
  static const darkBgColor = Color(0xff141315);
  static const greenColor = Color(0XFF2EC4B6);
  static const greyColor = Color(0xffD4D4D4);
  static const redColor = Color(0xffFF3C52);
  static const lightYellow = Color(0xffFAF8F8);
  static const darkGreyColor = Color(0xff232328);

  static final greyTextStyle = GoogleFonts.ptSans(
    color: greyColor,
    fontWeight: FontWeight.w700,
  );
  static final blackTextStyle = GoogleFonts.ptSans(
    color: darkBgColor,
    fontWeight: FontWeight.w700,
  );
  static final whiteTextStyle = GoogleFonts.ptSans(
    color: lightBgColor,
    fontWeight: FontWeight.w700,
  );
}
