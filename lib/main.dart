import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/forgetpassword/forget_cubit.dart';
import 'package:jaadara/busnieslogiclayer/auth/login/login_cubit.dart';
import 'package:jaadara/busnieslogiclayer/auth/register/register_cubit.dart';
import 'package:jaadara/busnieslogiclayer/home/homecubit.dart';
import 'package:jaadara/presntionlayer/auth/forgetview.dart';
import 'package:jaadara/presntionlayer/auth/login/loginview.dart';
import 'package:jaadara/presntionlayer/auth/resetpassword.dart';
import 'package:jaadara/presntionlayer/home/home.dart';
import 'package:jaadara/presntionlayer/splash/splashview.dart';
import 'busnieslogiclayer/auth/resendcode/resendcubit.dart';
import 'busnieslogiclayer/auth/setpassword/resetpasswordcubit.dart';
import 'presntionlayer/auth/resendcodeview.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit()),
        BlocProvider(create: (context) => ResendCodeCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResetPassword(),
      ),
    );
  }
}
