

     import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../const/style.dart';

class CustomTextFromField extends StatelessWidget {
  final String hinttext;
 // final String labeltext;
  final IconData? iconData;
  Widget? icon;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  // final bool isNumber;
   final bool? obscureText;
  final void Function()? onTapIcon;


  CustomTextFromField({
      required this.hinttext,

    //  this.labeltext,
       this.iconData,
      this.mycontroller,
       this.valid,
    this.icon,
      // this.isNumber,
       this.obscureText,
      this.onTapIcon, });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(
        15,
      ),
      child: Container(
        width: 355,
        child: TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return hinttext;
            }
            return null;
          },
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.name,
          controller: mycontroller,
          style: GoogleFonts.almarai(
              fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.w600),
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            prefixIcon: icon,
            errorStyle: TextStyle(
                fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
            hintText: hinttext,
            hintStyle: StyleApp.style1
          ),
        ),
      ),
    );
  }
}
