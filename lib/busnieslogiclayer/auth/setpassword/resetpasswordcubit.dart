import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/setpassword/resetpasswordstate.dart';
import 'package:jaadara/presntionlayer/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../datalayer/model/newpass.dart';
import '../../../datalayer/repo/setpassword.dart';
import '../../../helper/resultprocess.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  SetPassword? setPassword;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  SetPasswordData({var pass, confirm_password, required context}) async {
    setPassword = await SetPasswordRepo.getSetPassword(
        pass: pass, pass2: confirm_password);
    if (setPassword!.message == true) {
      ResultProcess.drewResultProcess(
        context: context,
        reson: setPassword!.message.toString(),
        status: true,
        nav: const HomeView(),
      );
      emit(ResetPasswordSuccess());
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: setPassword!.message.toString(),
          status: false);

      emit(ResetPasswordFailure());
    }
  }
}
