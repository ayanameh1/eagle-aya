// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eagle/CN/get_profile_cn.dart';
import 'package:eagle/components/config1.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/language_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<LanguageProvider>(
                create: (context) => LanguageProvider(),
                child: ProfileScreen()),
            ChangeNotifierProvider<Profile>(
              create: (context) => Profile(),
            )
          ],
          child: SafeArea(child: profilebody()),
        ),
      ),
    );
  }
}

class profilebody extends StatefulWidget {
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

  List<ListItem> _items =[];

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(builder: (context, profilemodel, child) {
      return Consumer<LanguageProvider>(builder: (context, lan, child) {
        return Directionality(
          textDirection: languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Padding(
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
                              languageProvider1.getTexts("Lana Halak")??'',
                              //profilemodel.pf?.title ?? "",
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
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text(
                              'lana.ha1@gmail.com',
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
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 800),
                        children: _getExpansionPanels(
                             _items
                            =[ListItem(
                              headerName: languageProvider1.getTexts('My Exhibition') ?? '',
                            ),   ListItem(
                        headerName: languageProvider1.getTexts('My Booths')??'',
                      ),],
                        //

                        // ]
            ),
                        expansionCallback: (panelIndex, isExpanded) {
                          _items[panelIndex].isExpanded = !isExpanded;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
          ),
        );
      });
    });

  }

  List<ExpansionPanel> _getExpansionPanels(List<ListItem> _items) {
    return _items.map<ExpansionPanel>((ListItem item) {
      return ExpansionPanel(
        //backgroundColor: Colors.white38,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(item.headerName),
          );
        },
        body: Container(
          height: 100,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.black12, width: 2))),
                child: ListTile(
                  title: Text('Expo $i'), //here we put exhibitionsName
                ),
              );
            },
          ),
        ),
        isExpanded: item.isExpanded,
      );
    }).toList();
  }
}

class ListItem extends profilebody {
  String headerName;
  bool isExpanded;
  //String exhibitionName //String exhibition(booth name)
  ListItem({
    required this.headerName,
    this.isExpanded = false,
  });
}
