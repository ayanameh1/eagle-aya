import 'package:flutter/material.dart';

import '../../components/confi.dart';
import '../../constants/colors.dart';

class Singlerequest extends StatelessWidget {
  const Singlerequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,
              color: currentTheme.isdark ? Colors.white : Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Request',
          style: TextStyle(fontFamily: 'Uniform'),
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(12.0)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: CircleAvatar(
                        radius: 48,
                        backgroundImage:
                            AssetImage('assets/images/download.jpg')),
                  ),
                  Expanded(
                    child: Text(
                      ' Al Durra company',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: currentTheme.isdark
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ],
              ),
            ),

      Column(
        children: [
          Text(
            'Personl informaiton',
            style: TextStyle(
              color: currentTheme.isdark?Colors.white:Colors.black,
              fontFamily: 'Uniform',
              fontWeight: FontWeight.bold,
              fontSize: sizeAware.width * 46 / 1080,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('First Name: Lana'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Last Name: Hallak'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Position Title: '),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Phone Number: 0938661910'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Current Address:'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Email Address: lana12@gmail.com'),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: currentTheme.isdark? Colors.grey[600]:Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2,
                  offset: Offset(4, 5), // Shadow position
                ),
              ],
            ),
          ),
           SizedBox(height: 30,),

          ///////////2
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    'Company informaiton',
                    style: TextStyle(
                      color: currentTheme.isdark?Colors.white:Colors.black,
                      fontFamily: 'Uniform',
                      fontWeight: FontWeight.bold,
                      fontSize: sizeAware.width * 46 / 1080,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Text('Company Name: Al Durra'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Phone Number: 0933345075'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Phone Number: 0938661910'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Business Email: durra@gmail.com '),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Fax Number: 0112142568'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Country: Syria '),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: currentTheme.isdark? Colors.grey[600]:Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 2,
                  offset: Offset(4, 5), // Shadow position
                ),
              ],
            ),
          ),
       SizedBox(height: 30,),
Container(
  child:  Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      children: [
        Text('Brochure Company'),
        SizedBox(height: 20,),
        Row(
          children: [
               Container(
                 width: MediaQuery.of(context).size.width * 900 / 1080,
              height: MediaQuery.of(context).size.height * 400 / 1920,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),),
            child: Image(image: AssetImage('assets/images/kkk.png',),
              fit: BoxFit.cover,
            ),),]),
      ],
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: currentTheme.isdark? Colors.grey[600]:Colors.grey[300],
    boxShadow: [
      BoxShadow(
        color: Colors.black38,
        blurRadius: 2,
        offset: Offset(4, 5), // Shadow position
      ),
    ],
  ),
),
SizedBox(height: 30,),
/////////////
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text('Boooth Number: 33'),
              ],
            ),
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: currentTheme.isdark? Colors.grey[600]:Colors.grey[300],
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 2,
            offset: Offset(4, 5), // Shadow position
          ),
        ],
      ),
    ),
////////////4
SizedBox(height: 30,),
Container(
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      children: [
        Row(
          children: [
            Text('Start Date:8/8/2022'),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('End Date:8/9/2022 '),
          ],
        ),
        SizedBox(height: 20,),
      ],
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: currentTheme.isdark? Colors.grey[600]:Colors.grey[300],
    boxShadow: [
      BoxShadow(
        color: Colors.black38,
        blurRadius: 2,
        offset: Offset(4, 5), // Shadow position
      ),
    ],
  ),
),
          //////////
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                Container(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Accept",
                      style: TextStyle(
                        color: black,
                        fontFamily: 'Uniform',
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
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Decline",
                      style: TextStyle(
                        color: black,
                        fontFamily: 'Uniform',
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
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: black,
                        fontFamily: 'Uniform',
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
                Container(
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
              ],
            ),
          )
        ],
      ),
    ]),),
    );
  }
}
