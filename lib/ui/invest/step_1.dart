// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:eagle/CN/pick_multiple_images.dart';
import 'package:eagle/components/components.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/add_expo/step1.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';


class InvestStep1Screen extends StatelessWidget {
  const InvestStep1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5C0099),
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: ChangeNotifierProvider(
        create: (context) => MultiImages(),
        child: InvestStep1Screeno(),
      ),
    );
  }
}



class InvestStep1Screeno extends StatefulWidget {
  @override
  State<InvestStep1Screeno> createState() => _InvestStep1ScreenoState();
}
class _InvestStep1ScreenoState extends State<InvestStep1Screeno> {
  //list
  String? value;
  final items = [
    'Syria',
    'Lebanon',
    'Sudan',
    'Russia',
    'India',
    'Armenia',
    'Belarus',
    'Brazil',
    'Egypt',
    'Iran',
    'Jordan',
    'Oman',
    'palestine',
    'Pakistan',
    'Qatar',
    'United-Arab-Emirates',
    'Philippines'
  ];


  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    var sizeAwareh = MediaQuery.of(context).size.height;


    DropdownMenuItem<String> buildMenuItem(String? item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item!,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ));
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
                    child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: sizeAware.height * 90 / 1920),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      'Personl informaiton',
                                      style: TextStyle(
                                        fontFamily: 'Uniform',
                                        fontWeight: FontWeight.bold,
                                        fontSize: sizeAware.width * 46 / 1080,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  defaulTexttFormField(
                                    sizeaware1: sizeAwareh,
                                    controller: fnamecontroller,
                                    label: 'First name',
                                    validate: (String? value) {
                                      if (value == null ||
                                          value.trim().length == 0) {
                                        return 'first name  must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  defaulTexttFormField(
                                    sizeaware1: sizeAwareh,
                                    controller: lnamecontroller,
                                    label: 'Last Name',
                                    validate: (String? value) {
                                      if (value == null ||
                                          value.trim().length == 0) {
                                        return 'last name  must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  defaulTexttFormField(
                                      sizeaware1: sizeAwareh,
                                      controller: postitlecontroller,
                                      label: 'Position Title',
                                      validate: (String? value) {
                                        if (value == null ||
                                            value.trim().length == 0) {
                                          return 'position title must not be empty';
                                        }
                                        return null;
                                      }),
                                  defaulTexttFormField(
                                      sizeaware1: sizeAwareh,
                                      controller: phone1controller,
                                      label: 'Phone Number',
                                      validate: (String? value) {
                                        if (value == null ||
                                            value.trim().length == 0) {
                                          return 'phone number must not be empty';
                                        }
                                        return null;
                                      }),
                                  defaulTexttFormField(
                                      sizeaware1: sizeAwareh,
                                      controller: curaddresscontroller,
                                      label: 'Current Address',
                                      validate: (String? value) {
                                        if (value == null ||
                                            value.trim().length == 0) {
                                          return 'current address must not be empty';
                                        }
                                        return null;
                                      }),
                                  defaulTexttFormField(
                                      sizeaware1: sizeAwareh,
                                      controller: emailaddresscontroller,
                                      label: 'Email Address',
                                      validate: (String? value) {
                                        if (value == null ||
                                            value.trim().length == 0) {
                                          return 'email Addressr must not be empty';
                                        }
                                        return null;
                                      })
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

                          //Second box (COMPANY INFORMATION)
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      'Company informaiton',
                                      style: TextStyle(
                                        fontFamily: 'Uniform',
                                        fontWeight: FontWeight.bold,
                                        fontSize: sizeAware.width * 46 / 1080,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  defaulTexttFormField(
                                    sizeaware1: sizeAwareh,
                                    controller: compnamecontroller,
                                    label: 'Company name',
                                    validate: (String? value) {
                                      if (value == null ||
                                          value.trim().length == 0) {
                                        return 'company name  must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  defaulTexttFormField(
                                    sizeaware1: sizeAwareh,
                                    controller: phone2controller,
                                    label: 'Phone Number',
                                    validate: (String? value) {
                                      if (value == null ||
                                          value.trim().length == 0) {
                                        return 'phone number  must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  defaulTexttFormField(
                                    sizeaware1: sizeAwareh,
                                    controller: busemailcontroller,
                                    label: 'Business email',
                                    validate: (String? value) {
                                      if (value == null ||
                                          value.trim().length == 0) {
                                        return 'business email must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  defaulTexttFormField(
                                      sizeaware1: sizeAwareh,
                                      controller: faxnumcontroller,
                                      label: 'Fax Number',
                                      validate: (String? value) {
                                        if (value == null ||
                                            value.trim().length == 0) {
                                          return 'fax number must not be empty';
                                        }
                                        return null;
                                      }),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular((50.0)),
                                      border: Border.all(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: value,
                                        iconSize: 36,
                                        hint: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            title: Text('Country',),
                                          ),
                                        ),
                                        icon: Icon(Icons.arrow_drop_down),
                                        isExpanded: true,
                                        items:
                                            items.map(buildMenuItem).toList(),
                                        onChanged: (value) =>
                                            setState(() => this.value = value),
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
                          //INVESTOR BROCHURE____________________________________________________________
                          Consumer<MultiImages>(
                              builder: (context, allimages, child) {
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(children: [
                                  Text(
                                    'Please provide a brochure to make it easier for visitor to understand your work and connect with you',
                                    style: TextStyle(
                                      fontFamily: 'Uniform',
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizeAware.width * 46 / 1080,
                                    ),
                                    textAlign: TextAlign.center,
                                    //maxLines: 3,
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: sizeAware.height * 47 / 1920,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0, left: 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        allimages.selectImages();
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
                                  ),
                                  SizedBox(
                                    height: sizeAware.height * 55 / 1920,
                                  ),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  allimages.imageFileList!.isEmpty
                                      ? Text(
                                          'no image was selected',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      :GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.all(0),
                                              shrinkWrap: true,
                                              itemCount: allimages.imageFileList!.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Stack(
                                                        children: [
                                                          Image.file(
                                                            File(allimages.imageFileList![
                                                                    index]!
                                                                .path),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              allimages.deleteimage(index,allimages.imageFileList);
                                                            },
                                                            child: Container(
                                                              child: Icon(Icons
                                                                  .highlight_remove),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                color: Colors
                                                                    .redAccent,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                              }),
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
                          SizedBox(
                            height: 30,
                          ),
                          //______________________________________________________________________
                          //How to would you like to present your product?
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(children: [
                                Text(
                                  'How to would you like to present your product?',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                  textAlign: TextAlign.center,
                                 // maxLines: 2,
                                  //overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: sizeAware.height * 47 / 1920,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          buildCheckBox(title: 'pictures'),
                                          buildCheckBox(title: 'videos'),
                                          buildCheckBox(title: 'real samples'),
                                          buildCheckBox(title: 'schemes'),
                                        ],
                                      ),
                                    ),
                                  ],
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
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 202 / 1920,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InvestStep2Screen(),
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
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController postitlecontroller = TextEditingController();
  TextEditingController phone1controller = TextEditingController();
  TextEditingController curaddresscontroller = TextEditingController();
  TextEditingController emailaddresscontroller = TextEditingController();
  TextEditingController compnamecontroller = TextEditingController();
  TextEditingController phone2controller = TextEditingController();
  TextEditingController busemailcontroller = TextEditingController();
  TextEditingController faxnumcontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();

  //checkboxes values
  bool valueI = false;
  bool valueA = false;
  bool valueM = false;
  bool valueT = false;
  bool valueB = false;

}
