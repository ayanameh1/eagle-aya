import 'dart:convert';
import 'dart:io';
import 'package:eagle/models/investor_info.dart';
import 'package:eagle/models/profile_info.dart';
import 'package:http/http.dart' as http;

Future<InvestorInfo?> getInvestorInfo() async {
  try {
    final Investorinfo = await http.get(Uri.parse("http://jsonplaceholder.typicode.com/posts/2"),
        headers: {
          HttpHeaders.contentTypeHeader :"application/json"
        });
    //_______________________________________________________
    if (Investorinfo.statusCode == 200) {
      var Investorbody = jsonDecode(Investorinfo.body);

      InvestorInfo Investor = InvestorInfo.fromJson(Investorbody);

      print('done');
      return  Investor;
    }
    //________________________________________________________
    else {
      print('sorry ');
    }
  } catch (e) {
    print(e.toString());
  }
}

