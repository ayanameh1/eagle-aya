import 'package:eagle/API_services//get_profile.dart';
import 'package:eagle/models/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends ChangeNotifier{
  bool loading=false;
  ProfileInfo ? pf;

  getprofileInfo() async {
    loading =true;
    pf = await getProfile();
    loading = false;
    notifyListeners();
  }
}