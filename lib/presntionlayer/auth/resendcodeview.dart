import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jaadara/const/style.dart';
import 'package:jaadara/presntionlayer/auth/regeister.dart';
import '../../../customwidget/bottomtitle.dart';
import '../../../customwidget/centertitle.dart';
import '../../../customwidget/customButton.dart';
import '../../../customwidget/drewtoplogo.dart';
import '../../../helper/massage.dart';
import '../../busnieslogiclayer/auth/forgetpassword/forget_cubit.dart';
import '../../busnieslogiclayer/auth/forgetpassword/forget_state.dart';
import '../../busnieslogiclayer/auth/resendcode/resendcubit.dart';
import '../../busnieslogiclayer/auth/resendcode/resendstate.dart';
import '../../datalayer/model/resendcode.dart';
import '../home/home.dart';
class ResendCode extends StatefulWidget {
  const ResendCode({Key? key}) : super(key: key);

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).size;

    return BlocConsumer<ResendCodeCubit, ResendCodeState>(
        listener: (conext, state) {
          if (state is ResendCodeLoading) {
            isloading = true;
          } else if (state is ResendCodeSuccess) {
            Navigator.of(context).push(MaterialPageRoute(builder: (p) => HomeView()));
          } else if (state is ResendCodeFailure) {
            MassageApp.snackBar(state.toString(), context);
          }
        },
        builder: (context, state) => Scaffold(
            body: Form(
              key: BlocProvider.of<ResendCodeCubit>(context).globalKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    drewTopLogo(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        drewCenterTitleAuth(title: "كود التحقيق"),
                      ],
                    ),
                    Text("برجاء ادخال الكود المرسل إليك",
                        style: GoogleFonts.tajawal(fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: HexColor("#D6212E"))),
                    Container(
                      margin: const EdgeInsets.only(left: 30, top: 30),
                      child: TextFormField(
                        controller: context.read<ResendCodeCubit>().code,
                      ),
                    ),
                    Container(
                      height: defaultSize.height * 0.1,
                    ),
                    CustomButton(
                      text: 'ارسال الكود',
                      onPressed: () async {
                        ResendCodeModel? resendCodeModel;
                        if (context.read<ResendCodeCubit>().globalKey.currentState!.validate()) {
                          // String code = context.read<ResendCodeCubit>().email!.text;
                          String email = BlocProvider.of<ForgetPasswordCubit>(context).email.text;
                          resendCodeModel = await context.read<ResendCodeCubit>().SendCodeData(context: context, email: email);
                        }
                      },
                    ),
                    drewBottomTitle(
                        rightText: "ليس لدى حساب بالفعل",
                        leftText: "تسجيل جديد",
                        context: context,
                        onTapIcon: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(builder: (p) => Register()));
                        })
                  ],
                ),
              ),
            )));
  }
}
