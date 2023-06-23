import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jaadara/datalayer/model/loginmodel.dart';
import 'package:jaadara/presntionlayer/home/home.dart';

import '../../../datalayer/repo/loginrepo.dart';
import '../../../helper/resultprocess.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel _loginModel = LoginModel();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  bool _seen = true;

  bool get seen => _seen;

  set seen(bool value) {
    _seen = value;
  }

  visibilityIcon() {
    if (_seen == true) {
      _seen = false;
    } else {
      _seen = true;
    }
  }

  LoginModel? loginModel;

  loginSendData({var email, pass, required context}) async {
    loginModel = await LoginRepo.getLoginRepo(
      email: email,
      password: pass,
      devId: 1,
    );
    if (loginModel!.status == true) {
      ResultProcess.drewResultProcess(
        context: context,
        reson: loginModel!.message.toString(),
        status: true,
        nav: const HomeView(),
      );
      emit(LoginSuccess());
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: loginModel!.message.toString(),
          status: false);

      emit(LoginFailure());
    }
  }
}
