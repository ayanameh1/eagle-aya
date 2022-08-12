// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:eagle/CN/booth_list.dart';
import 'package:eagle/CN/pick_single_image.dart';
import 'package:eagle/CN/post_addexpo_cn.dart';
import 'package:eagle/components/components.dart';
import 'package:eagle/components/confi.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/addexpo_body.dart';
import 'package:eagle/models/booth_details.dart';
import 'package:eagle/ui/add_expo/step1.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:eagle/widget/bottonHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../homelayout.dart';

class AddExpoStep2 extends StatelessWidget {
  final e;
  final l;
  final o;
  final m;
  final n;
  final i;
  AddExpoStep2({Key? key, this.e, this.l, this.o, this.m, this.n, this.i});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AddexpoPost(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExpoImage(),
          ),
          ChangeNotifierProvider(
            create: (context) => BoothsList(),
          ),
        ],
        child: AddExpoStep2Screen(
          e: e,
          l: l,
          o: o,
          m: m,
          n: n,
          i: i,
        ));
  }
}

//_______________________________________________________________________
class AddExpoStep2Screen extends StatefulWidget {
  final e;
  final l;
  final o;
  final m;
  final n;
  final i;
  const AddExpoStep2Screen(
      {Key? key, this.e, this.l, this.o, this.m, this.n, this.i})
      : super(key: key);

  @override
  _AddExpoStep2ScreenState createState() => _AddExpoStep2ScreenState();
}

class _AddExpoStep2ScreenState extends State<AddExpoStep2Screen> {
  set value(String? value) {}

  //date
  DateTime? date1, date2;
  String getText() {
    if (date1 == null) {
      return 'From';
    } else {
      return DateFormat('MM/dd/yyyy').format(date1!);
    }
  }

  String getText2() {
    if (date2 == null) {
      return 'To';
    } else {
      return DateFormat('MM/dd/yyyy').format(date2!);
    }
  }

  TextEditingController v = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController z = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_rounded,
              color: currentTheme.isdark ? Colors.white : Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
            child: Text(
          'Add Your Expo',
          style: TextStyle(
            fontFamily: 'Cermona',
          ),
        )),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Stack(children: [
        Consumer<AddexpoPost>(builder: (context, expo, child) {
          return Consumer<ExpoImage>(builder: (context, oneimage, child) {
            return Consumer<BoothsList>(builder: (context, Booths, child) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: sizeAware.height * 130 / 1920,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          //height: sizeAware.height * 1600 / 1920,
                          decoration: BoxDecoration(
                              color: currentTheme.isdark
                                  ? Colors.grey[600]
                                  : Colors.grey[500],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(28),
                                topLeft: Radius.circular(28),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(mainAxisSize: MainAxisSize.max,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                      height: sizeAware.height * 90 / 1920),
                                  // first box (EXPO INFORMATION)
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Text(
                                              'EXPO floor plan',
                                              style: TextStyle(
                                                color: currentTheme.isdark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontFamily: 'Uniform',
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    sizeAware.width * 46 / 1080,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              oneimage.imagefromGallery();
                                            },
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(Icons.photo,
                                                    color: darkpurple),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black38,
                                                    blurRadius: 2,
                                                    offset: Offset(2,
                                                        3), // Shadow position
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 3,
                                                  color: darkpurple,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            child: Center(
                                              child: oneimage.expoimage == null
                                                  ? Text(
                                                      'no image was selected')
                                                  : Image.file(
                                                      oneimage.expoimage!),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                              child: Text('Add booths here')),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                      controller: v,
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: 'booth name',
                                                        hintText:
                                                            'make it similar to the floorplan)',
                                                        hintStyle: TextStyle(
                                                          fontFamily: 'Uniform',
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  //width: 120,
                                                  child: TextFormField(
                                                    controller: x,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'booth size',
                                                      hintStyle: TextStyle(
                                                        fontFamily: 'Uniform',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                      controller: z,
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText:
                                                            'booth price',
                                                        hintStyle: TextStyle(
                                                          fontFamily: 'Uniform',
                                                        ),
                                                      )),
                                                ),
                                                IconButton(
                                                  icon: Icon(Icons.add),
                                                  onPressed: () {
                                                    if (v.text.isNotEmpty &&
                                                        x.text.isNotEmpty &&
                                                        z.text.isNotEmpty) {
                                                      Booths.addAbooth(Booth(
                                                          boothname: v.text,
                                                          price: z.text,
                                                          size: x.text));
                                                    } else {
                                                      final snackBar = SnackBar(
                                                        content: Text(
                                                            'you need to provide booth name , its price and its size '),
                                                        duration: Duration(
                                                            seconds: 2),
                                                        padding:
                                                            EdgeInsets.all(15),
                                                      );
                                                      Scaffold.of(context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                    v.clear();
                                                    x.clear();
                                                    z.clear();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 100,
                                            //width: 50,
                                            child: ListView.builder(
                                              itemCount:
                                                  Booths.boothdata.length,
                                              itemBuilder: (context, i) {
                                                return ListTile(
                                                    title: Text(Booths
                                                        .boothdata[i].boothname),
                                                subtitle: Text('size ' +
                                                Booths.boothdata[i].size +
                                                '\n price is '),
                                                trailing: IconButton(
                                                  icon: Icon(Icons.delete),
                                                onPressed: () {
                                                Booths.deleteAbooth(i);
                                                },),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: currentTheme.isdark
                                          ? Colors.grey[600]
                                          : Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 2,
                                          offset:
                                              Offset(4, 5), // Shadow position
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 30,
                                  ),
                                  //Second box (CONTACT INFORMATION)
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Text(
                                              'Time period',
                                              style: TextStyle(
                                                color: currentTheme.isdark
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontFamily: 'Uniform',
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    sizeAware.width * 46 / 1080,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                (54),
                                              ),
                                            ),
                                            child: ButtonWidget(
                                              text: getText(),
                                              onClicked: () =>
                                                  pickDate1(context),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                (54),
                                              ),
                                            ),
                                            child: ButtonWidget(
                                              text: getText2(),
                                              onClicked: () =>
                                                  pickDate2(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: currentTheme.isdark
                                          ? Colors.grey[600]
                                          : Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 2,
                                          offset:
                                              Offset(4, 5), // Shadow position
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        125 /
                                        1920,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          359 /
                                          1080,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              82 /
                                              1920,
                                      child: MaterialButton(
                                        onPressed: () async {
                                          AddExpoData v = AddExpoData(
                                              boothes_number: '5',
                                              title: this.widget.e,
                                              description: this.widget.l,
                                              fax_number: this.widget.m,
                                              email: this.widget.n,
                                              phone_number: this.widget.o,
                                              start_date: '8/8/2000',
                                              end_date: '9/8/2000',
                                              price: '5',
                                              image: this.widget.i);
                                          print(v.title);
                                          await expo.addexpoPost(v);
                                          if (expo.loading) {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      content: SpinKitCircle(
                                                        color: darkpurple,
                                                      ),
                                                    ));
                                          }
                                          if (expo.isback) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'your Expo has been added successfully');
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeLayout(),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          "Apply",
                                          style: TextStyle(
                                            fontFamily: 'Uniform',
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(54),
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
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          });
        }),
        Container(
          width: sizeAware.width * 1080 / 1080,
          height: sizeAware.height * 170 / 1920,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70)),
            color: darkpurple,
          ),
          child: Center(
            child: Text(
              'Step 2',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Uniform',
                fontWeight: FontWeight.bold,
                fontSize: sizeAware.width * 60 / 1080,
                color: Colors.white,
                //fontSize: 30,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future pickDate1(BuildContext context) async {
    final initialDate = DateTime(DateTime.now().year);
    final newDate = await showDatePicker(
      context: context,
      initialDate: date1 ?? initialDate,
      firstDate: DateTime(DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 3),
    );

    if (newDate == null) {
      showSnackBar(context, 'please enter the date');
    }

    setState(() => date1 = newDate);
  }

  Future pickDate2(BuildContext context) async {
    final initialDate = DateTime(DateTime.now().day);
    final newDate = await showDatePicker(
      context: context,
      initialDate: date2 ?? initialDate,
      firstDate: DateTime(DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 3),
    );

    if (newDate == null) {
      showSnackBar(context, 'please enter the date');
    }

    setState(() => date2 = newDate);
  }
}
