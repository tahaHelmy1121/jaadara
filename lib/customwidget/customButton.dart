import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/const/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  Color? mycolor;

  CustomButton(
      {Key? key, required this.text, this.onPressed,  this.mycolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).size;
    return Container(
      width: 356,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor("#D8282D"),
            HexColor("#EE583E"),
          ]
        ),
          borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Center(
            child: Text(text,

                style: StyleApp.style1,),
          ),
        ),
      ),
    );
  }
}
