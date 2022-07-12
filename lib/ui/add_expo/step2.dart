// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eagle/components/components.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/add_expo/step1.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:eagle/widget/bottonHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';

class AddExpoStep2Screen extends StatefulWidget {
  @override
  State<AddExpoStep2Screen> createState() => _AddExpoStep2ScreenState();
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

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    var sizeAwareh = MediaQuery.of(context).size.height;

    //images
    // File? image;
    // String? _image;
    // final picker = ImagePicker();
    // Future getImageFromGallery() async {
    //   final pickedFile =
    //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    //
    //   setState(() {
    //     if (pickedFile != null) {
    //       _image = pickedFile.path;
    //     }
    //   });
    // }
    //
    // Future showOptions() async {
    //   showCupertinoModalPopup(
    //     context: context,
    //     builder: (context) => CupertinoActionSheet(
    //       actions: [
    //         CupertinoActionSheetAction(
    //           child: Text('Photo Gallery'),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //             getImageFromGallery();
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_rounded),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddExpoStep1Screen(),
              ),
            );
          },
        ),
        title: SizedBox(
            child: Text(
              'Add Your Expo',
              style: TextStyle(
                fontFamily: 'Cermona',
                color: Colors.black,
              ),
            )),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: sizeAware.height * 130 / 1920,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: sizeAware.height,
                    decoration: BoxDecoration(
                        color: Color(0xffD6D6D6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(mainAxisSize: MainAxisSize.max,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: sizeAware.height * 90 / 1920),
                            // first box (EXPO INFORMATION)
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        'Choose booth',
                                        style: TextStyle(
                                          fontFamily: 'Uniform',
                                          fontWeight: FontWeight.bold,
                                          fontSize: sizeAware.width * 46 / 1080,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 2,
                                    offset: Offset(4, 5), // Shadow position
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
                                          fontFamily: 'Uniform',
                                          fontWeight: FontWeight.bold,
                                          fontSize: sizeAware.width * 46 / 1080,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            (54),
                                          ),
                                          color: Colors.black),
                                      child: ButtonWidget(
                                        text: getText(),
                                        onClicked: () => pickDate1(context),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            (54),
                                          ),
                                          color: Colors.black),
                                      child: ButtonWidget(
                                        text: getText2(),
                                        onClicked: () => pickDate2(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 2,
                                    offset: Offset(4, 5), // Shadow position
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  202 /
                                  1920,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    359 /
                                    1080,
                                height: MediaQuery.of(context).size.height *
                                    82 /
                                    1920,
                                child: MaterialButton(
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => AddExpo2Screen(),
                                    //   ),
                                    // );
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
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                color: white,
                fontFamily: 'Uniform',
                fontWeight: FontWeight.bold,
                fontSize: sizeAware.width * 60 / 1080,
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
