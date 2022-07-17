import 'package:eagle/API_services/post_signup.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../API_services/post_review.dart';
import '../models/review_comment.dart';

class ReviewPost extends ChangeNotifier{
  bool loading= false;
  bool isback= false;

  Future reviewpost(Review rdata) async {
    loading =true;
    notifyListeners();
    http.Response? rv = await postReview(rdata);
    if (rv != null){
    if(rv.statusCode==200 ||rv.statusCode==201){
      isback= true;
      loading = false;
      notifyListeners();
    }}

  }

}
