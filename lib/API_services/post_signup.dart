import 'dart:io';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response?> postSignup(SignupBody sdata) async {
  http.Response? signupresponse;
  try {
    signupresponse = await http.post(
      Uri.parse("http://192.168.1.37:8000/api/register"),
      body: jsonEncode(sdata.toJson()),
      headers: <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Charset': 'utf-8',
      },
    );
    print(signupresponse.statusCode);
    if (signupresponse.statusCode == 200 || signupresponse.statusCode == 201) {
      print(signupresponse.body);
      print('done');
      responsedataToken = jsonDecode(signupresponse.body)['token'];
    }
  } catch (e) {
    print(e.toString());
  }
  return signupresponse;
}
