import 'package:flutter/material.dart';

class About_us extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xff5C0099),
      title: SizedBox(
      child: Image.asset('assets/images/Group 8.png'),
    width: sizeAware.width * 257 / 1080,
    height: sizeAware.height * 150 / 160,
    ),
    shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: Text(
            'Our application  is  meant to make your life easier \n here you can find all the exhibitions you want, visit them and participate in them \n also  you can add your own expo and manage it on the tip of your finger\n'
                'we are a group of  third year students in Damascus University faculty information technology  and this was our project fot this year \n we hope yoy enjoy it . ',
            style: TextStyle(
                fontFamily: 'uniform',
            ),
          ),
        ),
      ),
  );
  }
}