import 'package:eagle/API_services/post_addexpo.dart';
import 'package:eagle/API_services/post_login.dart';
import 'package:eagle/API_services/post_signup.dart';
import 'package:eagle/models/addexpo_body.dart';
import 'package:eagle/models/login_body.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../API_services/post_addproduct.dart';
import '../models/addproduct.dart';

class AddproductPost extends ChangeNotifier{
  bool loading= false;
  bool isback= false;
  bool problem =false;
  String message = '';
  Future addproductPost(AddproductData sdata) async {
    loading =true;
    notifyListeners();
    var sp = await postAddpro(sdata);
    if(sp!.statusCode==200 ||sp!.statusCode==201){
      isback= true;
      notifyListeners();
    }
    if(sp!.statusCode==400){
      problem= true;
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

}
