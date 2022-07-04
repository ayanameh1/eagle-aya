import 'dart:convert';

import 'package:eagle/models/all_expo_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//class GetAll {
  Future<List<AllExpoData>?> getallexpo() async {
    try {
      final allexpo = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
      //
      if (allexpo.statusCode == 200) {
        var body = jsonDecode(allexpo.body) as List;
        List <AllExpoData> expolist = [];
        body.forEach((element) {
          AllExpoData a = AllExpoData.fromJson(element);
          expolist.add(a);
        });
        print(allexpo.body);
        return expolist;
      }
      //
      else {
        print('sorry ');
      }
    }
    //
    catch (e) {
      print(e.toString());
    }

  }
//}
