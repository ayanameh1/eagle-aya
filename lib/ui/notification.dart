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
      body: SafeArea(
        child:NotificationScreen1(),
      ),
    );
  }
}

class NotificationScreen1 extends StatefulWidget {
  const NotificationScreen1({Key? key}) : super(key: key);

  @override
  State<NotificationScreen1> createState() => _NotificationScreen1State();

}

class _NotificationScreen1State extends State<NotificationScreen1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
      itemCount: 50,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Card(
            child: ListTile(
              title: Text('notification $i'),
              subtitle: Text('$i'),
              leading: CircleAvatar(
                //radius: 60,
                  backgroundImage:
                  AssetImage('assets/images/Asset 1@4x.png')),
            ),
          ),
        );
      }),
    );
  }

}