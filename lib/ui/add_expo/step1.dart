// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eagle/CN/pick_single_image.dart';
import 'package:eagle/components/components.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/add_expo/step2.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

//
class AddExpoStep1Screen extends StatelessWidget {
  const AddExpoStep1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: ChangeNotifierProvider(
        create: (context) => SingleImage(),
        child: AddExpoStep1Screeno(),
      ),
    );
  }
}


//
class AddExpoStep1Screeno extends StatefulWidget {
  @override
  State<AddExpoStep1Screeno> createState() => _AddExpoStep1ScreenoState();
}

class _AddExpoStep1ScreenoState extends State<AddExpoStep1Screeno> {
  set value(String? value) {}

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    var sizeAwareh = MediaQuery.of(context).size.height;

    return Stack(children: [
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
                  decoration: BoxDecoration(
                      color: Color(0xffD6D6D6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        topLeft: Radius.circular(28),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      SizedBox(height: sizeAware.height * 90 / 1920),
                      // FIRST BOX (EXPO INFORMATION)
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'EXPO informaiton',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                ),
                              ),
                              defaulTexttFormField(
                                controller: titlecontroller,
                                prefix: Icons.title,
                                sizeaware1: sizeAwareh,
                                label: 'EXPO title',
                                validate: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return 'first name  must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              defaulTexttFormField(
                                prefix: Icons.edit,
                                sizeaware1: sizeAwareh,
                                controller: desccontroller,
                                label: 'Description',
                                validate: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return 'last name  must not be empty';
                                  }
                                  return null;
                                },
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
                      // END of FIRST BOX
                      SizedBox(
                        height: 30,
                      ),

                      // SECOND BOX (CONTACT INFORMATION)
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'Contact informaiton',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                ),
                              ),
                              defaulTexttFormField(
                                type: TextInputType.phone,
                                prefix: Icons.phone,
                                sizeaware1: sizeAwareh,
                                controller: phonecontroller,
                                label: 'Phone Number',
                                validate: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return 'company name  must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              defaulTexttFormField(
                                prefix: Icons.email,
                                sizeaware1: sizeAwareh,
                                controller: emailcontroller,
                                label: 'Email',
                                validate: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return 'phone number  must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              defaulTexttFormField(
                                type: TextInputType.phone,
                                prefix: Icons.local_phone_outlined,
                                sizeaware1: sizeAwareh,
                                controller: faxcontroller,
                                label: 'Fax Number',
                                validate: (String? value) {
                                  if (value == null ||
                                      value.trim().length == 0) {
                                    return 'business email must not be empty';
                                  }
                                  return null;
                                },
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
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'EXPO Type/Specality',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildCheckBox(
                                            title: 'Industrial',
                                            value1: valueI),
                                        buildCheckBox(
                                            title: 'Agricultural',
                                            value1: valueA),
                                        buildCheckBox(
                                            title: 'Medical', value1: valueM),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        buildCheckBox(
                                            title: 'Technology',
                                            value1: valueI),
                                        buildCheckBox(
                                            title: 'Building & caddling',
                                            value1: valueI),
                                        buildCheckBox(
                                            title: 'Other', value1: valueI),
                                      ],
                                    ),
                                  ),
                                ],
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
                      // END of SECOND BOX
                      SizedBox(
                        height: 30,
                      ),
                      // THIRD BOX (EXPO poster)
                      Consumer<SingleImage>(
                          builder: (context, oneimage, child) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'EXPO poster',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  'please provide us with an image of your expo poster',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: sizeAware.height * 47 / 1920,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 0, left: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        oneimage.imagefromCamera();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 2,
                                              offset: Offset(
                                                  2, 3), // Shadow position
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 3,
                                            color: darkpurple,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: darkpurple,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        oneimage.imagefromGallery();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 2,
                                              offset: Offset(
                                                  2, 3), // Shadow position
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 3,
                                            color: darkpurple,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.photo,
                                              color: darkpurple),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sizeAware.height * 55 / 1920,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  child: Center(
                                    child: oneimage.image == null
                                        ? Text('no image was selected')
                                        : Image.file(oneimage.image!),
                                  ),
                                ),
                              ),
                            ]),
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
                        );
                      }),
                      // END of THIRD BOX
                      SizedBox(
                        height: 30,
                      ),
                      //THE BUTTON
                      Container(
                        width: MediaQuery.of(context).size.width * 359 / 1080,
                        height: MediaQuery.of(context).size.height * 82 / 1920,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddExpoStep2Screen(),
                              ),
                            );
                          },
                          child: Text(
                            "Next",
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
                        height: 30,
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      //the 'STEP ONE' CONTAINER
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
            'Step 1',
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
    ]);
  }

  // CHECKBOX WIDGET
  Widget buildCheckBox({bool value1 = false, required String title}) =>
      StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return CheckboxListTile(
              value: value1,
              contentPadding: EdgeInsets.all(0),
              checkColor: Colors.white,
              activeColor: darkpurple,
              title: Text(title),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  value1 = value!;
                });
              });
        },
      );


  //controllers
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController faxcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();


  //checkboxes values
  bool valueI = false;
  bool valueA = false;
  bool valueM = false;
  bool valueT = false;
  bool valueB = false;
}

// class checkbox {
//   late final String title;
//   late bool value;
//   checkbox({required this.title, this.value = false});
// }
