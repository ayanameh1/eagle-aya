// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back_ios_rounded),
          title: SizedBox(
            child: Image.asset('assets/images/Group 8.png'),
            width: sizeAware.width * 257 / 1080,
            height: sizeAware.height * 146 / 160,
          ),
          shadowColor: Colors.black.withOpacity(0.5),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 40 / 1080,
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 48,
                        backgroundImage:
                        AssetImage('assets/images/Asset 1@4x.png')),
                    Text('company name'),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 35 / 1080,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff1f1f1),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(22), // Creates border
                      color: Color(0xffd7d7d7),),
                    indicatorPadding: EdgeInsets.all(0),
                    labelColor: darkpurple,
                    labelStyle: TextStyle(
                        fontFamily: 'Uniform', fontWeight: FontWeight.w600),
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: darkpurple,
                    tabs: [
                      Tab(
                        child: Text(
                          'About',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Brochure',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Products',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Announcement',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reviews',
                        ),
                      ),
                    ]
                ),
              ),
              Flexible(
                child: TabBarView(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.email),
                          Text('email')
                        ],
                      ),
                      SingleChildScrollView(child: Column(
                        children: [
                          Icon(Icons.flight, size: 350),
                          Icon(Icons.flight, size: 350),
                          Icon(Icons.flight, size: 350),
                        ],
                      )),
                      Icon(Icons.directions_car, size: 350),
                      Icon(Icons.directions_car, size: 350),
                      Icon(Icons.directions_car, size: 350),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
