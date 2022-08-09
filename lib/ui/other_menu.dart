// ignore_for_file: prefer_const_constructors

import 'package:eagle/components/config1.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/homelayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class Otherscreen extends StatelessWidget {
  const Otherscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LanguageProvider>(
          create: (context) => LanguageProvider()),
    ], child: Otherscreeno());
  }
}

class Otherscreeno extends StatefulWidget {
  const Otherscreeno({Key? key}) : super(key: key);

  @override
  State<Otherscreeno> createState() => _OtherscreenoState();
}

class _OtherscreenoState extends State<Otherscreeno> {
  @override
  // void initState() {
  //   super.initState();
  //   final profilemodel = Provider.of<LanguageProvider>(context, listen: false);
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(builder: (context, la, child) {
      return languageProvider1.isLoading
          ? Scaffold(
              body: Container(
                  child: SpinKitCircle(
              color: darkpurple,
            )))
          : Directionality(
              textDirection: languageProvider1.isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          languageProvider1.getTexts('Settings') ?? 'Settings',
                          style: TextStyle(
                            //color: Colors.black,
                            fontFamily: 'Uniform',
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        height: 10,
                        color: Colors.black54,
                      ),
                      Container(
                        alignment: languageProvider1.isEn
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        padding: EdgeInsets.only(top: 20, right: 22),
                        // child:Text('drawer_switch_title',
                        // style:TextStyle(fontWeight: FontWeight.bold),
                        // ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: (languageProvider1.isEn ? 0 : 20),
                            left: (languageProvider1.isEn ? 20 : 0),
                            bottom: 15,
                            top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              languageProvider1.getTexts('arabic') ?? 'arabic',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                languageProvider1
                                    .changeLan(!languageProvider1.isEn);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
                              },
                              icon: Icon(Icons.add),
                            ),
                            // Switch(
                            //   value: languageProvider1.isEn,
                            //   onChanged: (newValue) {
                            //     languageProvider1.changeLan(newValue);
                            //   },
                            // ),
                            Text(
                              languageProvider1.getTexts('english') ??
                                  'english',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        height: 10,
                        color: Colors.black54,
                      ),
                      // //language
                      // ListTile(
                      //   onTap: (){},
                      //   leading: Icon(Icons.language),
                      //   title: Text(
                      //     'Language',
                      //     style: TextStyle(
                      //       //color: Colors.black,
                      //       fontFamily: 'Uniform',
                      //     ),
                      //   ),
                      //   trailing: dropdownlanguage(),
                      // ),

                      //about us
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text(
                          languageProvider1.getTexts('About us') ?? 'About us',
                          style: TextStyle(
                            //color: Colors.black,
                            fontFamily: 'Uniform',
                          ),
                        ),
                      ),

                      //logout
                      ListTile(
                          leading: Icon(Icons.logout),
                          title: Text(
                            languageProvider1.getTexts('Logout') ?? 'Logout',
                            style: TextStyle(
                              //  color: Colors.black,
                              fontFamily: 'Uniform',
                            ),
                          ),
                          onTap: () {}),
                      // Padding(
                      //   padding: EdgeInsets.only(right: (lan.isEn?0:20),left:(lan.isEn?20:0),bottom:15,top:15),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text('english',
                      //         style:TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //       Switch(
                      //         value: Provider.of<LanguageProvider>(context,listen: true).isEn,
                      //         onChanged:(newValue){
                      //           Provider.of<LanguageProvider>(context,listen:false).changeLan(newValue);
                      //           Navigator.of(context).pop();
                      //         },
                      //       ),
                      //       Text('arabic',
                      //         style:TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ));
    });
  }
}

// LANGUAGE DROPDOWN MENU BUTTON _______________________________________________
// class dropdownlanguage extends StatefulWidget {
//   const dropdownlanguage({Key? key}) : super(key: key);
//
//   @override
//   State<dropdownlanguage> createState() => _dropdownlanguageState();
// }
//
// class _dropdownlanguageState extends State<dropdownlanguage> {
//   String value ='English';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//         value: value,
//         icon: Icon(Icons.keyboard_arrow_down_outlined),
//         elevation: 16,
//         onChanged: (value) {setState(()  {
//           this.value=value!;
//         });},
//         items: const [
//           DropdownMenuItem(
//             child: Text(
//               'arabic',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontFamily: 'Uniform',
//               ),
//             ),
//             value: 'arabic',
//           ),
//           DropdownMenuItem(
//             child: Text(
//               'English',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontFamily: 'Uniform',
//               ),
//             ),
//             value: 'English',
//           ),
//         ]);
//   }
// }
