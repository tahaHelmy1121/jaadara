import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../model/loginmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class LoginRepo {
  static Future<LoginModel> getLoginRepo({var email, password, token, devId}) async {
    Map<String, dynamic> body = {
      "email": email.toString(),
      "password": password.toString(),
      "token_firebase": token.toString(),
      "device_id": devId.toString(),
    };
    var response = await http
        .post(Uri.http("ecommerce-jaadara.site.jadara.work","api/login"),
        body: body,
        headers: {
          //   "Accept": "application/json",
          "Accept-Language": "ar",
        }
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = LoginModel.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = LoginModel.fromJson(json);
      return result;
    }
  }
}
