import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget{
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('NEWS'),
          ],
        ),
      ),
    );
  }
}