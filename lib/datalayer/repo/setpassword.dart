import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../model/newpass.dart';
import '../model/registermodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class SetPasswordRepo {
  static Future<SetPassword> getSetPassword(
      {var pass,pass2}) async {
    SetPassword? registerModel = SetPassword();
    Map<String, dynamic> body = {
    "password":pass.toString(),
      "confirm_password":pass2.toString(),
    };

    var response = await http.post(
        Uri.http("ecommerce-jaadara.site.jadara.work","api/reset-password"),body: body,
        headers: {
       //   "Accept": "application/json",
          "Accept-Language": "ar",

        });

    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SetPassword.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SetPassword.fromJson(json);
      return result;
    }
  }
}
