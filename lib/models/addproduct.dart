import 'package:flutter/material.dart';
import 'dart:io';

class AddproductData {
  String? name;
  String? price;
  File ? image_name;
  AddproductData({this.name,this.price,this.image_name});

  AddproductData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price =json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
