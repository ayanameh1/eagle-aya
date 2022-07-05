import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: sizeAware.width *406/1080,
                    height: sizeAware.width *111 /1920,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: darkpurple,
              ),
                  child: Text('Step 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white,
                        fontFamily: 'Uniform',
                        fontWeight: FontWeight.bold,
                        //fontSize: 30,
                    ),
                    ),
                  ),
                SizedBox(height: sizeAware.height *124/1920),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Personl informaiton'),
                          ],
                        ),
                          SizedBox(height: sizeAware.height*47/1920,),
                          Row(
                            children: [
                              Text('First Name'),
                              SizedBox(width:sizeAware.width* 139/1080,),
          Container(
              width: sizeAware.width * 421 / 1080,
              height: sizeAware.height * 46 / 1920,
              child: TextFormField(
                        //controller: namecontrller,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return 'first name must not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: '',
                         labelStyle: TextStyle(
                            fontFamily: 'Uniform',
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
              ),
                        ),
          ],
                          ),
                          SizedBox(height: sizeAware.height*28/1920,),
                          Row(
                            children: [
                              Text('Last Name'),
                              SizedBox(width:sizeAware.width* 139/1080,),
                              Container(
                                width: sizeAware.width * 421 / 1080,
                                height: sizeAware.height * 46 / 1920,
                                child: TextFormField(
                                  //controller: namecontrller,
                                  keyboardType: TextInputType.name,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  onChanged: (String value) {
                                    print(value);
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.trim().length == 0) {
                                      return 'Last name must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: '',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Uniform',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: sizeAware.height*28/1920,),
                          Row(
                            children: [
                              Text('Position title'),
                              SizedBox(width:sizeAware.width* 105/1080,),
                              Container(
                                width: sizeAware.width * 421 / 1080,
                                height: sizeAware.height * 46 / 1920,
                                child: TextFormField(
                                  //controller: namecontrller,
                                  keyboardType: TextInputType.text,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  onChanged: (String value) {
                                    print(value);
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.trim().length == 0) {
                                      return 'position title must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: '',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Uniform',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: sizeAware.height*28/1920,),
                          Row(
                            children: [
                              Text('Phone Number'),
                              SizedBox(width:sizeAware.width* 50/1080,),
                              Container(
                                width: sizeAware.width * 421 / 1080,
                                height: sizeAware.height * 46 / 1920,
                                child: TextFormField(
                                  //controller: namecontrller,
                                  keyboardType: TextInputType.phone,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  onChanged: (String value) {
                                    print(value);
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.trim().length == 0) {
                                      return 'phone must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: '',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Uniform',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: sizeAware.height*28/1920,),
                          Row(
                            children: [
                              Text('Current Address'),
                              SizedBox(width:sizeAware.width* 40/1080,),
                              Container(
                                width: sizeAware.width * 421 / 1080,
                                height: sizeAware.height * 46 / 1920,
                                child: TextFormField(
                                  //controller: namecontrller,
                                  keyboardType: TextInputType.streetAddress,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  onChanged: (String value) {
                                    print(value);
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.trim().length == 0) {
                                      return 'current address must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: '',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Uniform',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: sizeAware.height*28/1920,),
                          Row(
                            children: [
                              Text('Email Address'),
                              SizedBox(width:sizeAware.width* 85/1080,),
                              Container(
                                width: sizeAware.width * 421 / 1080,
                                height: sizeAware.height * 46 / 1920,
                                child: TextFormField(
                                  //controller: namecontrller,
                                  keyboardType: TextInputType.emailAddress,
                                  onFieldSubmitted: (String value) {
                                    print(value);
                                  },
                                  onChanged: (String value) {
                                    print(value);
                                  },
                                  validator: (String? value) {
                                    if (value == null || value.trim().length == 0) {
                                      return 'email address must not be empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: '',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Uniform',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: sizeAware.height*28/1920,),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[200],
                      border: Border.all(
                        width: 1,
                      )),
                ),
                ],
              ),
            ),
          ),
        ),
    );
  }

}