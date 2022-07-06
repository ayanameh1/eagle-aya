import 'package:flutter/material.dart';

class AllExpoData {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;
  String? title;

  AllExpoData({this.postId, this.id, this.name, this.email, this.body,this.title});

  AllExpoData.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
    title =json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    data['title'] = this.title;
    return data;
  }
}
