import 'package:eagle/API_services/post_login.dart';
import 'package:eagle/API_services/post_signup.dart';
import 'package:eagle/models/login_body.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginPost extends ChangeNotifier{
  bool loading= false;
  bool isback= false;
  bool problem =false;
  String message = '';
  Future LogPost(LoginBody sdata) async {
    loading = true;
    notifyListeners();
    http.Response? sp = await postLogin(sdata);
    if(sp!.statusCode==200 ||sp!.statusCode==201){
      isback= true;
      notifyListeners();
      loading = false;
      notifyListeners();
    }
    if(sp!.statusCode==400 ||sp!.statusCode==401){
      loading = false;
      notifyListeners();
      problem= true;
      notifyListeners();
    }
  }

}
