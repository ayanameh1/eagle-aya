import 'dart:convert';
import 'dart:io';
import 'package:eagle/models/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ProfileInfo?> getProfile() async {
  try {
    final profile = await http.get(Uri.parse("http://jsonplaceholder.typicode.com/posts/2"),
    headers: {
      HttpHeaders.contentTypeHeader :"application/json"
    });
    //
    if (profile.statusCode == 200) {
      var profilebody = jsonDecode(profile.body);

      ProfileInfo p = ProfileInfo.fromJson(profilebody);

      print('done');
      return p;
    }
    //
    else {
      print('sorry ');
    }
  } catch (e) {
    print(e.toString());
  }
}

