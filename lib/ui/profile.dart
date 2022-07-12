// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eagle/CN/get_profile_cn.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<Profile>(
          create: (context) => Profile(),
          child: SafeArea(child: profilebody()),
        ),
      ),
    );
  }
}

class profilebody extends StatefulWidget {
  const profilebody({Key? key}) : super(key: key);

  @override
  _profilebodyState createState() => _profilebodyState();
}

class _profilebodyState extends State<profilebody> {
  @override
  void initState() {
    super.initState();
    final profilemodel = Provider.of<Profile>(context, listen: false);
    profilemodel.getprofileInfo();
  }

  @override
  Widget build(BuildContext context) {
    //final profilemodel = Provider.of<Profile>(context);
    return Consumer<Profile>(builder: (context, profilemodel, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: profilemodel.loading
            ? Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: SpinKitPouringHourGlassRefined(
                    color: yellow1,
                    size: MediaQuery.of(context).size.width * 500 / 1080,
                  ),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/Asset 1@4x.png')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          profilemodel.pf?.title ?? "",
                          style:Theme.of(context).textTheme.bodyText1,

                  ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'h',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  //language
                  ListTile(
                    title: Text(
                      'My Exhibitions',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Uniform',
                      ),
                    ),
                    onTap: (){
                      DropdownMenuItem(
                        child: Text(
                          'arabic',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Uniform',
                          ),
                        ),
                        value: 'dds',
                      );
                    },
                    trailing:Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                  ListTile(
                    title: Text(
                      'My Investments',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Uniform',
                      ),
                    ),
                    trailing: DropdownButton<String>(
                        value: null,
                        underline: Container(),
                        icon: Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        onChanged: (value) {},
                        items: const [
                          DropdownMenuItem(
                            child: Text(
                              'arabic',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Uniform',
                              ),
                            ),
                            value: 'dds',
                          ),
                          DropdownMenuItem(
                            child: Text(
                              'English',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Uniform',
                              ),
                            ),
                            value: 'dsa',
                          ),
                        ]),
                  ),
                ],
              ),
      );
    });
  }
}
