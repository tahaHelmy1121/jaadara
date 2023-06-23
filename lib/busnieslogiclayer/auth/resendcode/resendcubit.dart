import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/resendcode/resendstate.dart';
import 'package:jaadara/presntionlayer/auth/resetpassword.dart';

import '../../../datalayer/model/resendcode.dart';
import '../../../datalayer/repo/resendcode.dart';
import '../../../helper/resultprocess.dart';
import '../../../presntionlayer/home/home.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit() : super(ResendCodeInitial());

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController code = TextEditingController();
  ResendCodeModel resendCodeModel = ResendCodeModel();

  SendCodeData({required context, required String email}) async {
    resendCodeModel = await ResendCode.getResendRepo(code: code.text, email: email);
    if (resendCodeModel.status == true) {
      ResultProcess.drewResultProcess(
        context: context,
        reson: resendCodeModel.message.toString(),
        status: true,
        nav: const ResetPassword(),
      );
      emit(ResendCodeSuccess());
    } else {
      ResultProcess.drewResultProcess(context: context, reson: resendCodeModel!.message.toString(), status: false);

      emit(ResendCodeFailure());
    }
  }
}
