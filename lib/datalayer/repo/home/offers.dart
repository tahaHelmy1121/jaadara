import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../model/offers.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class OfferRepo {
  static Future<Offers> getOfferRepo() async {
    var response = await http.get(
        Uri.http("ecommerce-jaadara.site.jadara.work",
            "api/get-products-top-offers"),
        headers: {
          "key"
              "limit"
              "Accept": "application/json",
          // "Accept-Language": "ar",
        });

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = Offers.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = Offers.fromJson(json);
      return result;
    }
  }
}
