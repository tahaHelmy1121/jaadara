import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/presntionlayer/auth/resendcodeview.dart';

import '../../../datalayer/model/forgetmodel.dart';
import '../../../datalayer/repo/forget.dart';
import '../../../helper/resultprocess.dart';
import '../../../presntionlayer/home/home.dart';
import 'forget_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetState> {
  ForgetPasswordCubit() : super(forgetInitial());

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();

  forgetSendData({var email, pass, required context}) async {
    forgetPasswordModel = await ForgetRepo.getForgetRepo(
      email: email,
    );
    if (forgetPasswordModel.status == true) {
      ResultProcess.drewResultProcess(
        context: context,
        reson: forgetPasswordModel.message.toString(),
        status: true,
        nav:  ResendCode(),
      );
      emit(forgetSuccess());
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: forgetPasswordModel.message.toString(),
          status: false);

      emit(forgetfalure());
    }
  }
}
