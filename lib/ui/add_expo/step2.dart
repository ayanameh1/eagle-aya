// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:eagle/components/components.dart';
import 'package:eagle/components/confi.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/addexpo_body.dart';
import 'package:eagle/ui/add_expo/step1.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:eagle/widget/bottonHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
class fghjd extends StatelessWidget {
  final e;
  final l;
  final o;
  final m;
  final n;
  final i;
  fghjd({Key? key, this.e, this.l, this.o, this.m, this.n, this.i});

  @override
  Widget build(BuildContext context) {
    return AddExpoStep2Screen(e: e,l:l,o: o,m: m,n: n,i: i,);
  }
}

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

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    var sizeAwareh = MediaQuery.of(context).size.height;

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
                        color: currentTheme.isdark
                            ? Colors.grey[600]
                            : Colors.grey[200],
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
                                          color: currentTheme.isdark
                                              ? Colors.white
                                              : Colors.black,
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
                                color: currentTheme.isdark
                                    ? Colors.grey[600]
                                    : Colors.grey[200],
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
                                          color: currentTheme.isdark
                                              ? Colors.white
                                              : Colors.black,
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
                                      ),
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
                                      ),
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
                                color: currentTheme.isdark
                                    ? Colors.grey[600]
                                    : Colors.grey[200],
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
                                  onPressed: () async {
                                    AddExpoData v = AddExpoData(
                                        title: this.widget.e,
                                        description: this.widget.l,
                                        fax_number: this.widget.m,
                                        email: this.widget.n,
                                        phone_number: this.widget.o,
                                        price: '5',
                                        image: this.widget.i);
                                   // await SignupPost.Signpost(s);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddExpoStep2Screen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(
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
                fontFamily: 'Uniform',
                fontWeight: FontWeight.bold,
                fontSize: sizeAware.width * 60 / 1080,
                color: currentTheme.isdark ? Colors.white : Colors.black,
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
