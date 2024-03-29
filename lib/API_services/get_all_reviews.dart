import 'dart:convert';
import 'package:eagle/models/all_expo_data.dart';
import 'package:eagle/models/review_comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List <Review> reviewlist = [];
Future<List<Review>> getallreviews() async {
  try {
    final allreviews = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    //
    if (allreviews.statusCode == 200) {
      var body = jsonDecode(allreviews.body) as List;

      body.forEach((element) {
        Review a = Review.fromJson(element);
        reviewlist.add(a);
      });
      print(allreviews.body);
      return reviewlist;
    }
    //
    else {
      return  reviewlist;
    }
  }
  //
  catch (e) {
    return  reviewlist;
  }

}

