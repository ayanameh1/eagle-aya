import 'package:eagle/API_services/post_signup.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignupPost extends ChangeNotifier{
  bool loading= false;
  bool isback= false;
 Future Signpost(SignupBody sdata) async {
    loading =true;
    notifyListeners();
    http.Response? sp = await postSignup(sdata);
    if(sp!.statusCode==200 ||sp!.statusCode==201){
      isback= true;

    }
    loading = false;
   notifyListeners();
  }

}
