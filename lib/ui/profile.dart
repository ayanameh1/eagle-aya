import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return SafeArea(
       child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: sizeAware.width * 495 / 1080,
                height: sizeAware.height * 80 / 1920,
                child: Text(
                  'Manage Your Booth',
                ),
              ),
              SizedBox(
                height: sizeAware.height * 297 / 1920,
              ),
              Container(
                width: sizeAware.width * 495 / 1080,
                height: sizeAware.height * 80 / 1920,
                child: Text(
                  'Manage your Expo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
