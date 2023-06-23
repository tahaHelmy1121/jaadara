import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/login/login_cubit.dart';
import 'package:jaadara/busnieslogiclayer/auth/login/login_state.dart';
import 'package:jaadara/const/style.dart';
import 'package:jaadara/datalayer/model/loginmodel.dart';
import 'package:jaadara/presntionlayer/auth/forgetview.dart';

import '../../../customwidget/bottomtitle.dart';
import '../../../customwidget/centertitle.dart';
import '../../../customwidget/customButton.dart';
import '../../../customwidget/customtextfromfield.dart';
import '../../../customwidget/drewtoplogo.dart';
import '../../../helper/massage.dart';
import '../../home/home.dart';
import '../regeister.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (conext, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (p) => HomeView()));
        } else if (state is LoginFailure) {
          MassageApp.snackBar(state.toString(), context);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: BlocProvider.of<LoginCubit>(context).globalKey,
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
                  mycontroller: BlocProvider.of<LoginCubit>(context).email,
                ),
                CustomTextFromField(
                    obscureText: context.watch<LoginCubit>().seen,
                    hinttext: 'كلمة المرور',
                    mycontroller: BlocProvider.of<LoginCubit>(context).pass,
                    icon: InkWell(
                      onTap: () {
                        context.read<LoginCubit>().visibilityIcon();
                      },
                      child: Container(
                          width: 1,
                          height: 1,
                          child: Image.asset(
                            "assets/image/eye.png",
                            width: 0.1,
                            height: 0.1,
                          )),
                    )),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (p) => ForgetPasswordView()));
                          },
                          child: Text(
                            "هل نسيت كلمة المرور",
                            style: StyleApp.style1,
                          )),
                    )
                  ],
                ),
                Container(
                  height: defaultSize.height * 0.2,
                ),
                CustomButton(
                    text: 'تسجيل الدخول',
                    onPressed: () async {
                      LoginModel? loginModel;
                      if (context
                          .read<LoginCubit>()
                          .globalKey
                          .currentState!
                          .validate()) {
                        String pass = context.read<LoginCubit>().pass!.text;
                        String email = context.read<LoginCubit>().email!.text;

                        loginModel =
                            await context.read<LoginCubit>().loginSendData(
                                  email: email,
                                  pass: pass,
                                  context: context,
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
