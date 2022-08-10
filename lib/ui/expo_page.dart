import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/company_details.dart';
import 'package:eagle/ui/homelayout.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/invest/step_1.dart';
import 'package:flutter/material.dart';

import '../components/config1.dart';

class ExpoPage extends StatefulWidget {
  const ExpoPage({Key? key}) : super(key: key);

  @override
  State<ExpoPage> createState() => _ExpoPageState();
}

class _ExpoPageState extends State<ExpoPage> {
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;

    return Directionality(
        textDirection: languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child:Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeLayout()))),
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: SafeArea(
        child: Column(


          children: [

            SizedBox(
              child: Image.asset('assets/images/ddd.png'),
              width: sizeAware.width * 1080 / 1080,
              height: sizeAware.height * 608 / 1920,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 300/ 1920,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 799 / 1080,
                height: MediaQuery.of(context).size.height * 197 / 1920,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyDetails(),
                      ),
                    );
                  },
                  child: Text(
                    languageProvider1.getTexts( "Visit")??"",
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Uniform',
                        fontSize: MediaQuery.of(context).size.width * 45 / 799,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    color: yellow1,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff565656),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(2, 4),
                      ),
                    ]),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 40/ 1920,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 799 / 1080,
                height: MediaQuery.of(context).size.height * 197 / 1920,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InvestStep1Screen(),
                      ),
                    );
                  },
                  child: Text(
                    languageProvider1.getTexts("Invest")??"",
                    style: TextStyle(
                      color: black,
                      fontFamily: 'Uniform',
                      fontSize: MediaQuery.of(context).size.width * 45 / 799,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    color: grey1,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff565656),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(2, 4),
                      ),
                    ]),
              ),
            ),
            //SizedBox(
              //height: MediaQuery.of(context).size.height *  1139/ 1920,
             // width: MediaQuery.of(context).size.height * 

            //)

          ],
        ),
      ),
    ));
  }
}
