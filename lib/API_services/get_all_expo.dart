import 'dart:convert';
import 'package:eagle/models/all_expo_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List <AllExpoData> expolist = [];
  Future<List<AllExpoData>> getallexpo() async {
    try {
      final allexpo = await http.get(
          Uri.parse("http://192.168.108.51:8000/api/getall"));
      //
      if (allexpo.statusCode == 200) {
        var body = jsonDecode(allexpo.body) as List;

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
        AllExpoData n = AllExpoData(postId:2,id:2,name:'name',email:'email',body:'body');
        expolist=[n];
        return expolist;
      }
    }
    //
    catch (e) {
      print(e.toString());
      AllExpoData n = AllExpoData(postId:2,id:2,name:'name',email:'email',body:'body');
      expolist=[n];
      return expolist;
    }

  }

