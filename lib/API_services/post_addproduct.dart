import 'dart:io';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/addexpo_body.dart';
import 'package:eagle/models/addproduct.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<http.StreamedResponse?> postAddpro(AddproductData sdata) async {
  //http.Response? request;
  http.StreamedResponse ?g;
  try{
    final request = await http.MultipartRequest(
      "POST",
      Uri.parse('http://1192.168.1.37:8000/api/add'),
    );
    request.headers.addAll({
      "Authorization": "Bearer $responsedataToken",
      "Content-Type" : "multipart/form-data",
      "Accept":"application/json"
      //"Charset": "utf-8",
      //"Accept-Encoding" : "gzip, deflate, br",
    });

    request.files.add(await http.MultipartFile.fromPath('image', sdata.image_name!.path));

    request.fields['name'] = sdata.name!;
    request.fields['price'] = sdata.price!;

    var res = await request.send();
    print(res.statusCode);
    return res;
  }
  catch(errr){
    print (errr.toString());
  }
  return g;
}
