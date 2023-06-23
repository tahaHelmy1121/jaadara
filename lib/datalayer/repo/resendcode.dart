import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import '../model/resendcode.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class ResendCode {
  static Future<ResendCodeModel> getResendRepo({var code, email}) async {
    Map<String, dynamic> body = {"code": '$code', "email": '$email'};
    print('pody is $body');
    var response = await http.post(
      Uri.http("ecommerce-jaadara.site.jadara.work", "api/active-account"),
      body: body,
      headers: {
        //  "Accept": "application/vnd.api+json",
        "Accept-Language": "ar",
      },
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResendCodeModel.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ResendCodeModel.fromJson(json);
      return result;
    }
  }
}
