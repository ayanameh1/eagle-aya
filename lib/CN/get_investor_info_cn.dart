import 'package:eagle/API_services/get_investor_info.dart';
import 'package:eagle/models/investor_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestorProfile extends ChangeNotifier{
  bool loading=false;
  InvestorInfo ? Ip;

  getInvestorProfile() async {
    loading =true;
    Ip = await getInvestorInfo();
    loading = false;
    notifyListeners();
  }
}