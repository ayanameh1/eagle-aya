import 'dart:convert';
import 'package:eagle/API_services//get_all_expo.dart';
import 'package:eagle/API_services/get_all_reviews.dart';
import 'package:eagle/models/review_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GetAllReviews extends ChangeNotifier{


  late final body;
  List<Review> ? data ;
  bool loading = false;

  getallReviewsData() async {
    loading = true;
    data = (await getallreviews());
    loading =false;
    notifyListeners();
  }

}