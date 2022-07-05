import 'package:flutter/material.dart';

class httpresponse<T>{
  late bool issuccessful;
  T ? data;
  String ? message;
  int ? responsecode;
  httpresponse(this.issuccessful,this.data,{this.message,this.responsecode});
}