import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/busnieslogiclayer/auth/login/login_cubit.dart';
import 'package:jaadara/busnieslogiclayer/auth/login/login_state.dart';
import 'package:jaadara/datalayer/model/forgetmodel.dart';
import 'package:jaadara/datalayer/model/loginmodel.dart';

import '../../../customwidget/bottomtitle.dart';
import '../../../customwidget/centertitle.dart';
import '../../../customwidget/customButton.dart';
import '../../../customwidget/customtextfromfield.dart';
import '../../../customwidget/drewtoplogo.dart';
import '../../../helper/massage.dart';
import '../../busnieslogiclayer/auth/forgetpassword/forget_cubit.dart';
import '../../busnieslogiclayer/auth/forgetpassword/forget_state.dart';
import '../../busnieslogiclayer/auth/setpassword/resetpasswordcubit.dart';
import '../../busnieslogiclayer/auth/setpassword/resetpasswordstate.dart';
import '../home/home.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).size;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (conext, state) {
        if (state is ResetPasswordLoading) {
          isloading = true;
        } else if (state is ResetPasswordSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (p) => HomeView()));
        } else if (state is ResetPasswordFailure) {
          MassageApp.snackBar(state.toString(), context);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: BlocProvider.of<ResetPasswordCubit>(context).globalKey,
            child: Column(
              children: [
                drewTopLogo(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        drewCenterTitleAuth(title: "تعين كلمة المرور الجديدة"),
                      ],
                    ),
                  ],
                ),
                CustomTextFromField(
                  hinttext: 'كلمة المرور الجديدة',
                  mycontroller:
                      BlocProvider.of<ResetPasswordCubit>(context).pass,
                ),
                CustomTextFromField(
                  hinttext: 'تأكيد كلمة المرور الجديدة',
                  mycontroller:
                      BlocProvider.of<ResetPasswordCubit>(context).pass2,
                ),
                Container(
                  height: defaultSize.height * 0.2,
                ),
                CustomButton(
                  onPressed: () {
                    BlocProvider.of<ResetPasswordCubit>(context)
                        .SetPasswordData(
                            context: context,
                            pass: BlocProvider.of<ResetPasswordCubit>(context)
                                .pass,
                            confirm_password:
                                BlocProvider.of<ResetPasswordCubit>(context)
                                    .pass2);
                  },
                  text: 'ارسال ',
                ),
                SizedBox(
                  height: 16,
                ),
                drewBottomTitle(
                    rightText: "لم يتم ارسال بعد  ",
                    leftText: "ارسال مرة اخرى",
                    context: context,
                    onTapIcon: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
