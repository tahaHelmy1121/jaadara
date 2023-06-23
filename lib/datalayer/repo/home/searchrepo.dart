

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:jaadara/datalayer/model/searchmodel.dart';


dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class LoginRepo {
  static Future<List> getLoginRepo({var title}) async {
    Map<String, dynamic> body = {
      "search": title.toString(),

    };
    var response = await http
        .post(
        Uri.http("ecommerce-jaadara.site.jadara.work", "api/search-product"),
        body: body,
        headers: {
          //   "Accept": "application/json",
          "Accept-Language": "ar",
        }
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final filteredData = data.where((item) {
        final name = item['name'].toLowerCase();
        final description = item['description'].toLowerCase();
        return name.contains(title.toLowerCase()) || description.contains(title.toLowerCase());
      }).toList();
      return filteredData;
    } else {
      throw Exception('Failed to load data');
    }
  }
  }

