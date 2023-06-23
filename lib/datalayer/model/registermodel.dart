

import 'dart:convert';

import 'package:jaadara/datalayer/model/loginmodel.dart';

RegisterModel registerModelFromMap(String str) => RegisterModel.fromJson(json.decode(str));
class RegisterModel {
  Data? data;
  String? message;
  var status;

  RegisterModel({this.data, this.message, this.status});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}