// import 'package:flutter/material.dart';
// import 'dart:io';
//
// class AddExpoData {
//   String? title;
//   String? description;
//   String? phone_number;
//   String? email;
//   String? fax_number;
//   String? boothes_number;
//   String? price;
//   String? start_date;
//   String? end_date;
//   File ? image;
//   AddExpoData({this.title, this.description, this.phone_number, this.email, this.fax_number,this.boothes_number,this.end_date,this.price,this.start_date,this.image});
//
//   AddExpoData.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     description = json['description'];
//     phone_number = json['phone_number'];
//     email = json['email'];
//     fax_number = json['fax_number'];
//     boothes_number =json['boothes_number'];
//     price =json['price'];
//     end_date =json['end_date'];
//     start_date =json['start_date'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['phone_number'] = this.phone_number;
//     data['email'] = this.email;
//     data['boothes_number'] = this.boothes_number;
//     data['price'] = this.price;
//     data['end_date'] = this.end_date;
//     data['start_date'] = this.start_date;
//     data['fax_number'] = this.fax_number;
//     return data;
//   }
// }
