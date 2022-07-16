import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
class ManageExpo extends StatelessWidget {
  const ManageExpo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ManageExpoQ(),
      ),
    );
  }
}

class ManageExpoQ extends StatefulWidget {
  const ManageExpoQ({Key? key}) : super(key: key);

  @override
  State<ManageExpoQ> createState() => _ManageExpoQState();

}

class _ManageExpoQState extends State<ManageExpoQ> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/ddd.png'),
        Container(
          width: MediaQuery.of(context).size.width * 359 / 1080,
          height: MediaQuery.of(context).size.height * 82 / 1920,
          child: MaterialButton(
            onPressed: () {
              // Navigator.push(
              //   context,MaterialPageRoute(builder: (context) => SignUpScreen(),
              // ),
              // );
            },
            child: Text(
              "View Requests",
              style: TextStyle(
                color: black,
                fontFamily: 'Uniform',
              ),
            ),


          ),
        ),
      ],
    );
  }
}
