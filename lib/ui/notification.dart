import 'package:eagle/API_services/get_all_expo.dart';
import 'package:eagle/API_services/get_all_expo.dart';
import 'package:eagle/CN/get_all_expo_cn.dart';
import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:eagle/API_services/get_all_expo.dart';
import 'homepage.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('NEWS'),
        ],
      ),
    );
  }
}

//Text('title: ${post?.body}\n\n')