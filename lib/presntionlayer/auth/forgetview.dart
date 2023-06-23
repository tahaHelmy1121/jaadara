import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/forgetpassword/forget_cubit.dart';
import 'package:jaadara/busnieslogiclayer/auth/forgetpassword/forget_state.dart';
import 'package:jaadara/datalayer/model/forgetmodel.dart';
import 'package:jaadara/presntionlayer/auth/regeister.dart';
import 'package:jaadara/presntionlayer/auth/resendcodeview.dart';

import '../../../customwidget/bottomtitle.dart';
import '../../../customwidget/centertitle.dart';
import '../../../customwidget/customButton.dart';
import '../../../customwidget/customtextfromfield.dart';
import '../../../customwidget/drewtoplogo.dart';
import '../../../helper/massage.dart';


class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).size;
    return BlocConsumer<ForgetPasswordCubit, ForgetState>(
      listener: (conext, state) {
        if (state is forgetLoading) {
          isloading = true;
        } else if (state is forgetSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (p) => ResendCode()));
        } else if (state is forgetfalure) {
          MassageApp.snackBar(state.toString(), context);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: BlocProvider.of<ForgetPasswordCubit>(context).globalKey,
            child: Column(
              children: [
                drewTopLogo(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    drewCenterTitleAuth(title: "تسجيل الدخول"),
                  ],
                ),
                CustomTextFromField(
                  hinttext: 'البريد الاكترونى',
                  mycontroller: BlocProvider.of<ForgetPasswordCubit>(context).email,
                ),
                Container(
                  height: defaultSize.height * 0.2,
                ),
                CustomButton(
                    text: 'ارسال الايميل',
                    onPressed: () async {
                      ForgetPasswordModel? forgetPasswordModel;
                      if (context
                          .read<ForgetPasswordCubit>()
                          .globalKey
                          .currentState!
                          .validate()) {
                        String email = context.read<ForgetPasswordCubit>().email!.text;
                        forgetPasswordModel =
                        await context.read<ForgetPasswordCubit>().forgetSendData(
                            email: email,
                            context: context
                        );
                      }
                    }),
                SizedBox(
                  height: 16,
                ),
                drewBottomTitle(
                    rightText: "ليس لدى حساب بالفعل",
                    leftText: "تسجيل جديد",
                    context: context,
                    onTapIcon: () {
                      Navigator.pop(context);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (p) => Register()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
