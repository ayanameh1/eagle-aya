import 'package:eagle/components/components.dart';
import 'package:eagle/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'addExpo2.dart';

class AddExpoScreen extends StatefulWidget {
  @override
  State<AddExpoScreen> createState() => _AddExpoScreenState();
}

class _AddExpoScreenState extends State<AddExpoScreen> {
  set value(String? value) {}

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
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
    
     //list
    String? value;
    final items = ['Syria','Lebanon','Sudan','Russia','India','Armenia','Belarus','Brazil','Egypt','Iran','Jordan','Oman','palestine','Pakistan','Qatar','United-Arab-Emirates','Philippines'];
    DropdownMenuItem<String> buildMenuItem(String? item) => DropdownMenuItem(
      value: item,
      child: Text(
        item!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      )
    );

    //images
    File? image;
    String? _image;
    final picker = ImagePicker();
    Future getImageFromGallery() async {
      final pickedFile =
      await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);

      setState(() {
        if (pickedFile != null) {
          _image = pickedFile.path;
        }
      });
    }
    Future showOptions() async {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text('Photo Gallery'),
              onPressed: () {
                Navigator.of(context).pop();
                getImageFromGallery();
              },
            ),
          ],
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        leading: Image(
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: sizeAware.width * 406 / 1080,
                height: sizeAware.width * 111 / 1920,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: darkpurple,
                ),
                child: Text(
                  'Step 1',
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Personl informaiton'),
                        ],
                      ),
                      SizedBox(
                        height: sizeAware.height * 47 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: fnamecontroller,
                        label: 'First name',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'first name  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: lnamecontroller,
                        label: 'Last Name',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'last name  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: postitlecontroller,
                          label: 'Position Title',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'position title must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: phone1controller,
                          label: 'Phone Number',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'phone number must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: curaddresscontroller,
                          label: 'Current Address',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'current address must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: emailaddresscontroller,
                          label: 'Email Address',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Company informaiton'),
                        ],
                      ),
                      SizedBox(
                        height: sizeAware.height * 47 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: compnamecontroller,
                        label: 'Company name',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'company name  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: phone2controller,
                        label: 'Phone Number',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'phone number  must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                        controller: busemailcontroller,
                        label: 'Business email',
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'business email must not be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      defaulTexttFormField(
                          controller: faxnumcontroller,
                          label: 'Fax Number',
                          validate: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'fax number must not be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: sizeAware.height * 28 / 1920,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((50.0)),
                          border: Border.all(),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                             value: value,
                            iconSize: 36,
                            hint: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text('Country'),
                              ),
                            ),
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            items: items.map(buildMenuItem).toList(),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Plaese provide a brochure to make it easier for visitor to understand your work and connect with you',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeAware.height * 47 / 1920,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, left: 0),
                      child: GestureDetector(
                        onTap: () {
                          showOptions();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[200],
                              border: Border.all(
                                width: 1,
                              )),
                          child: Center(
                            child: _image == null
                                ? Padding(
                              padding:
                              EdgeInsets.fromLTRB(25, 25, 25, 25),
                              child: Icon(
                                Icons.image,
                                size: 40,
                                color: Color(0xFF03566E),
                              ),
                            )
                                : CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                              FileImage(File(_image!)),
                            ),
                          ),
                        ),
                      ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'How to would you like to present your product?',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeAware.height * 47 / 1920,
                    ),
                    Text('')
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
                        builder: (context) => AddExpo2Screen(),
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
            ]),
          ),
        ),
      ),
    );
  }
}
