import 'dart:io';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response?> postSignup(SignupBody sdata) async {
  http.Response? signupresponse;
  try {
    signupresponse = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"),
        body: jsonEncode(sdata.toJson()),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    print(signupresponse.statusCode);
    if (signupresponse.statusCode == 200) {
      print(signupresponse.body);
    }
  } catch (e) {
    print(e.toString());
  }
  return signupresponse;
}
