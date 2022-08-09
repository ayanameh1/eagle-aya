import 'dart:convert';
import 'package:eagle/models/booth_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BoothsList extends ChangeNotifier{
  List<String>  booths=[] ;
  List<Booth>  boothdata=[] ;
  bool loading = false;


  addAbooth(Booth v) async{
    boothdata.insert(0,v);
    notifyListeners();
    print(boothdata);
  }
  deleteAbooth(int i) async{
    boothdata.remove(boothdata[i]);
    notifyListeners();
    print(boothdata);
  }

  // getallReviewsData() async {
  //   loading = true;
  //   boothdata = (await getallreviews());
  //   loading =false;
  //   notifyListeners();
  // }

}