import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/datalayer/model/registermodel.dart';
import 'package:jaadara/helper/massage.dart';
import 'package:jaadara/presntionlayer/auth/login/loginview.dart';
import 'package:jaadara/presntionlayer/home/home.dart';
import '../../busnieslogiclayer/auth/register/register_cubit.dart';
import '../../busnieslogiclayer/auth/register/register_state.dart';
import '../../customwidget/bottomtitle.dart';
import '../../customwidget/centertitle.dart';
import '../../customwidget/customButton.dart';
import '../../customwidget/customtextfromfield.dart';
import '../../customwidget/drewtoplogo.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    var defaultSize = MediaQuery.of(context).size;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (conext, state) {
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (p) => HomeView()));
        } else if (state is RegisterFailure) {
          MassageApp.snackBar(state.toString(), context);
        }
      },
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: BlocProvider.of<RegisterCubit>(context).globalKey,
              child: Column(
                children: [
                  drewTopLogo(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      drewCenterTitleAuth(title: "إنشاء حساب جديد"),
                    ],
                  ),
                  CustomTextFromField(
                    hinttext: 'الاسم',
                    mycontroller: BlocProvider.of<RegisterCubit>(context).name,
                  ),
                  CustomTextFromField(
                    hinttext: 'البريد الاكترونى',
                    mycontroller: BlocProvider.of<RegisterCubit>(context).email,
                  ),
                  CustomTextFromField(
                    hinttext: 'كلمة المرور',
                    mycontroller: BlocProvider.of<RegisterCubit>(context).pass,
                    icon: Container(
                      width: 1,
                      height: 1,
                      child: Image.asset(
                        "assets/image/eye.png",
                        width: 0.1,
                        height: 0.1,
                      ),
                    ),
                  ),
                  CustomTextFromField(
                    hinttext: 'اعادة كلمة المرور',
                    mycontroller: BlocProvider.of<RegisterCubit>(context).pass2,
                    icon: Container(
                      width: 1,
                      height: 1,
                      child: Image.asset(
                        "assets/image/eye.png",
                        width: 0.1,
                        height: 0.1,
                      ),
                    ),
                  ),
                  Container(
                    height: defaultSize.height * 0.2,
                  ),
                  CustomButton(
                      text: 'إنشاء حساب جديد',
                      onPressed: () async {
                        RegisterModel? registerModel;
                        if (context
                            .read<RegisterCubit>()
                            .globalKey
                            .currentState!
                            .validate()) {
                          String name =
                              context.read<RegisterCubit>().name!.text;
                          String email =
                              context.read<RegisterCubit>().email!.text;
                          String pass =
                              context.read<RegisterCubit>().pass!.text;
                          String pass2 =
                              context.read<RegisterCubit>().pass2!.text;
                          registerModel = await context
                              .read<RegisterCubit>()
                              .registerSendData(
                              name: name,
                              email: email,
                              pass: pass,
                              confirm_password: pass2,
                              dId: 1,
                              context: context,
                              token: 1);
                        }
                      }),
                  SizedBox(
                    height: 12,
                  ),
                  drewBottomTitle(
                    leftText: "تسجيل جديد",
                    onTapIcon: () {
                      Navigator.pop(context);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (p) => LoginView()));
                    },
                    rightText: "لدي حساب بالفعل",
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
