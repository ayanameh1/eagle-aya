import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';


import 'homepage.dart';

class AddExpo2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left)),
        title: Image(
          image: AssetImage('assets/images/Group 8.png'),
          width: sizeAware.width * 299 / 1080,
          height: sizeAware.height * 131 / 1920,
        ),
        shadowColor: Colors.black.withOpacity(0),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                      width: sizeAware.width * 406 / 1080,
                      height: sizeAware.width * 111 / 1920,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: darkpurple,
                      ),
                      child: Text(
                        'Step 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white,
                          fontFamily: 'Uniform',
                          fontWeight: FontWeight.bold,
//fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: sizeAware.height * 124 / 1920),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Choose booth',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sizeAware.height * 47 / 1920,
                          ),
                        ]),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                          border: Border.all(
                            width: 1,
                          )),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Time period',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sizeAware.height * 47 / 1920,
                          ),
                        ]),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                          border: Border.all(
                            width: 1,
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 202 / 1920,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 359 / 1080,
                      height: MediaQuery.of(context).size.height * 82 / 1920,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Apply",
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
                  ])))),
    );
  }
}
