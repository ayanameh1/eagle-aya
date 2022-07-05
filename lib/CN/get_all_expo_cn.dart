import 'dart:convert';

import 'package:eagle/API_services//get_all_expo.dart';
import 'package:eagle/models/all_expo_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GetAllExpo extends ChangeNotifier{


  late final body;
  List<AllExpoData> ? data ;
  bool loading = false;

 getallexpoData() async {
   loading = true;
   data = await getallexpo();
   loading =false;
   notifyListeners();
 }

}