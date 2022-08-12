import 'dart:io';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/login_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response?> postLogin(LoginBody sdata) async {
  http.Response? loginresponse;
  try {
    loginresponse = await http.post(
      Uri.parse("http://192.168.1.37:8000/api/login"),
      body: jsonEncode(sdata.toJson()),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Charset': 'utf-8',
      },
    );
    print(loginresponse.statusCode);
    if (loginresponse.statusCode == 200 || loginresponse.statusCode == 201) {
      print(loginresponse.body);
      responsedataToken = jsonDecode(loginresponse.body)['access_token'];
    }
  } catch (e) {
    print(e.toString());
  }
  return loginresponse;
}