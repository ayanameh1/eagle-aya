import 'package:flutter/material.dart';

class SignupBody {
  String? name;
  String? email;
  String? password;

  SignupBody({this.name, this.email, this.password});

  SignupBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}