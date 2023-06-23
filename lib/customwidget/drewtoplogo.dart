import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
     Widget drewTopLogo(){
return          Row(
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
          Container(
               margin: EdgeInsets.symmetric(vertical: 32, horizontal: 14),
               child: Column(
                    children: [
                         Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: Text("جدارة",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor("#D6212E"))),
                         ),
                         Text("متجرك الاكترونى",
                             style: GoogleFonts.tajawal(
                                 fontSize: 14,
                                 fontStyle: FontStyle.normal,
                                 fontWeight: FontWeight.w500,
                                 color: HexColor("#D6212E"))),
                    ],
               ),
          ),
          Container(
              margin: EdgeInsets.only(right: 25),
              width: 40,
              height: 40,
              child: Image.asset(
                   "assets/image/icon.jpg",
                   fit: BoxFit.cover,
              )),
     ],
);
     }