import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../model/slider.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class SliderRepo {
  static Future<SliderModel> getSliderRepo() async {

    var response = await http
        .get(Uri.http("ecommerce-jaadara.site.jadara.work","api/get-sliders"),
        headers: {
          "Accept": "application/json",
          "Accept-Language": "ar",
        }
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SliderModel.fromJson(json);
      print(result);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = SliderModel.fromJson(json);
      return result;
    }
  }
}
