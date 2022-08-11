import 'package:eagle/components/config1.dart';
import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';

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


//_________________________________________________________________
class ManageExpoQ extends StatefulWidget {
  const ManageExpoQ({Key? key}) : super(key: key);

  @override
  State<ManageExpoQ> createState() => _ManageExpoQState();

}

class _ManageExpoQState extends State<ManageExpoQ> {


  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child:Column(
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
    languageProvider1.getTexts("View Requests")??"",
              style: TextStyle(
                color: black,
                fontFamily: 'Uniform',
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
