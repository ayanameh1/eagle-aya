import 'dart:io';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/addexpo_body.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future postAddex(AddExpoData sdata) async {
  //http.Response? request;
  try{
    final request = await http.MultipartRequest(
      "POST",
      Uri.parse('http://192.168.108.51:8000/api/add'),
    );
    request.headers.addAll({
      "Authorization": "Bearer $responsedataToken",
      "Content-Type" : "multipart/form-data",
      "Accept":"application/json"
      //"Charset": "utf-8",
      //"Accept-Encoding" : "gzip, deflate, br",
    });

    request.files.add(await http.MultipartFile.fromPath('image', sdata.image!.path));

    request.fields['title'] = sdata.title!;
    request.fields['price'] = sdata.price!;
    request.fields['start_date'] = sdata.start_date!;
    request.fields['end_date'] = sdata.end_date!;
    request.fields['email'] = sdata.email!;
    request.fields['description'] = sdata.description!;
    request.fields['boothes_number'] = sdata.boothes_number!;
    request.fields['fax_number'] = sdata.fax_number!;
    request.fields['phone_number'] = sdata.phone_number!;

    var res = await request.send();
    print(res.statusCode);
    return request;
  }
  catch(errr){
    print (errr.toString());
  }

}
