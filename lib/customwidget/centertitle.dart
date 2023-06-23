import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget drewCenterTitleAuth({var title}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 30),
    child: Text(title,
        style: GoogleFonts.tajawal(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: HexColor("#005E8A"))),
  );
}
