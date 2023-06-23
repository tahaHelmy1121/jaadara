import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jaadara/busnieslogiclayer/auth/register/register_state.dart';
import 'package:jaadara/datalayer/model/registermodel.dart';
import 'package:jaadara/presntionlayer/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../datalayer/repo/registerrepo.dart';
import '../../../helper/resultprocess.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> form = GlobalKey<FormState>();
  RegisterModel? _registerModel;

  RegisterModel? get registerViewModel => _registerModel;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController pass2 = TextEditingController();
  final TextEditingController name = TextEditingController();
  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  registerSendData(
      {var email,
        name,
        pass,
        confirm_password,
        dId,
        token,
        required context}) async {
    _registerModel = await RegisterRepo.getRegisterResponse(
        email: email,
        password: pass,
        cpass: confirm_password,
        name: name,
        token: token,
        device: dId);
    if (_registerModel!.status == true) {
      _sharedPreferences = await SharedPreferences.getInstance();
      // _sharedPreferences!
      //     .setInt("customerId", _registerModel!.data!.user!.id!.toInt());
      // _sharedPreferences!
      //     .setInt("customerType",_registerModel!.data!.user!.id!.toInt());
      ResultProcess.drewResultProcess(
        context: context,
        reson: _registerModel!.message.toString(),
        status: true,
        nav: const HomeView(),
      );
      emit(RegisterSuccess());
    } else {
      ResultProcess.drewResultProcess(
          context: context,
          reson: _registerModel!.message.toString(),
          status: false);

      emit(RegisterFailure());
    }
  }
}
