import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:jaadara/datalayer/model/bestsellers.dart';

import '../../model/slider.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class SellerRepo {
  static Future<Seller> getSellerRepo() async {

    var response = await http
        .get(Uri.http("ecommerce-jaadara.site.jadara.work","api/get-products-best-seller"),
        headers: {
          "Accept": "application/json",
          "Accept-Language": "ar",
        }
    );

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = Seller.fromJson(json);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = Seller.fromJson(json);
      return result;
    }
  }
}
