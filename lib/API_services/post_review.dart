import 'dart:io';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/review_comment.dart';

Future<http.Response?> postReview(Review rdata) async {
  http.Response? reviewresponse;
  try {
    reviewresponse = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"),
        body: jsonEncode(rdata.toJson()),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});
    print(reviewresponse.statusCode);
    if (reviewresponse.statusCode == 200) {
      print(reviewresponse.body);
    }
  } catch (e) {
    print(e.toString());
  }
  return reviewresponse;
}
