import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../model/forgetmodel.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ForgetRepo {
  static Future<ForgetPasswordModel> getForgetRepo({var email}) async {
    Map<String, dynamic> body = {
      "email": email.toString(),
    };
    var response = await http.post(
        Uri.http("ecommerce-jaadara.site.jadara.work","api/forget-password"),
        body: body,
        headers: {
          "Accept": "application/json",
          "Accept-Language": "ar",
        });

    if (response.statusCode == 200) {
   //   print(response.statusCode);
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ForgetPasswordModel.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ForgetPasswordModel.fromJson(json);
      return result;
    }
  }
}
