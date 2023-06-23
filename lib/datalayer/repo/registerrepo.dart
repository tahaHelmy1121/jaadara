import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../model/registermodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class RegisterRepo {
  static Future<RegisterModel> getRegisterResponse(
      {var name, email, token, phone, cpass, password, device}) async {
    RegisterModel? registerModel = RegisterModel();
    Map<String, dynamic> body = {
      "email": email.toString(),
      "name": name.toString(),
      "password": password.toString(),
      "confirm_password": cpass.toString(),
      "device_id": device.toString(),
      "token_firebase": token.toString(),
    };

    var response = await http.post(
        Uri.http("ecommerce-jaadara.site.jadara.work","api/register"),body: body,
        headers: {
          "Accept": "application/json",
          "Accept-Language": "ar",

        });

    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RegisterModel.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = RegisterModel.fromJson(json);
      return result;
    }
  }
}
