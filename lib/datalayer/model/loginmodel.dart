
import 'dart:convert';

//LoginModel loginModelFromMap(String str) => LoginModel.fromJson(json.decode(str));
class LoginModel {
  Data? data;
  String? message;
  var status;

  LoginModel({this.data, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  var id;
  var name;
  var email;
  var phone;
  var phoneKey;
  var currentBalance;
  var outgoingBalance;
  var incomingBalance;
  var photo;
  var isNotifiy;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.phoneKey,
        this.currentBalance,
        this.outgoingBalance,
        this.incomingBalance,
        this.photo,
        this.isNotifiy});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneKey = json['phone_key'];
    currentBalance = json['current_balance'];
    outgoingBalance = json['outgoing_balance'];
    incomingBalance = json['incoming_balance'];
    photo = json['photo'];
    isNotifiy = json['is_notifiy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phone_key'] = this.phoneKey;
    data['current_balance'] = this.currentBalance;
    data['outgoing_balance'] = this.outgoingBalance;
    data['incoming_balance'] = this.incomingBalance;
    data['photo'] = this.photo;
    data['is_notifiy'] = this.isNotifiy;
    return data;
  }
}