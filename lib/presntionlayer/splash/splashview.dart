import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/presntionlayer/auth/regeister.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customwidget/drewtoplogo.dart';
import '../home/home.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  getCustomerTypeNav(BuildContext context) async {
    SharedPreferences _sharedPreferences =
    await SharedPreferences.getInstance();
    int? _typeValue = _sharedPreferences.getInt("customerType");
    if (_typeValue==0||_typeValue==null) {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context, animation, _) {
              return FadeTransition(
                opacity: animation,
                child: const Register(),
              );
            }), (route) => false),
      );
    } else if (_typeValue == 1) {
      Timer(
        const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
            PageRouteBuilder(pageBuilder: (context,animation,_) {
              return FadeTransition(
                opacity: animation,
                child:  HomeView(),
              );
            }), (route) => false),
      );
    } else {
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomerTypeNav(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    child: Image.asset("assets/image/1-Splash.png",fit: BoxFit.cover,),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,

                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 240,left: 80),
                    child:Column(
                      children: [
                        Container(
                       //     margin: EdgeInsets.only(right: 25),
                            width: 64,
                            height: 74,
                            child: Image.asset(
                              "assets/image/icon.jpg",
                              fit: BoxFit.cover,
                            )),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("جدارة",
                              style: GoogleFonts.tajawal(
                                  fontSize: 26,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  color: HexColor("#D6212E"))),
                        ),
                        Text("متجرك الاكترونى",
                            style: GoogleFonts.tajawal(
                                fontSize: 26,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: HexColor("#D6212E"))),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
