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
    var sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Color(0xff5C0099)),
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: const SafeArea(
        child: notificationlist(),
      ),
    );
  }
}

class notificationlist extends StatefulWidget {
  const notificationlist({Key? key}) : super(key: key);

  @override
  State<notificationlist> createState() => _notificationlistState();
}

class _notificationlistState extends State<notificationlist> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Card(
                    child: ListTile(
                      title: Text('Eagle'),
                      subtitle: Text('hi '),
                      leading: CircleAvatar(
                          //radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/Asset 1@4x.png')),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
