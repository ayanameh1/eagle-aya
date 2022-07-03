// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'dart:isolate';
import 'package:eagle/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eagle/CN/passwordvisiblity.dart';

class SignUpScreen extends StatelessWidget {
  @override
  String? msgStatus;
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontrller = TextEditingController();
  TextEditingController namecontrller = TextEditingController();
  TextEditingController passworddcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool isPassword = true;
  var textInputDecoration;
  bool loading = false;
  String error = '';

  validator() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not validated");
    }
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

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
        child: SafeArea(
          child: ChangeNotifierProvider<Passwordvisibilty>(
            create: (context) => Passwordvisibilty(),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                          image: AssetImage('assets/images/Asset 6a.png'),
                          width: MediaQuery.of(context).size.width * 617 / 1080,
                          height: MediaQuery.of(context).size.height * 353 / 1920,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 134 / 1920,
                      ),
                      Container(
                        width: sizeAware.width * 764 / 1080,
                        height: sizeAware.height * 107 / 1920,
                        child: TextFormField(
                          controller: emailcontrller,
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {
                            print(value);
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'email must not be empty';
                            }
                            if (!RegExp("").hasMatch(value)) {
                              return "Please Enter valid email ";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'email',
                            hintStyle: TextStyle(
                              fontFamily: 'Uniform',
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(54),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: sizeAware.width * 764 / 1080,
                        height: sizeAware.height * 107 / 1920,
                        child: TextFormField(
                          controller: namecontrller,
                          keyboardType: TextInputType.name,
                          onFieldSubmitted: (String value) {
                            print(value);
                          },
                          onChanged: (String value) {
                            print(value);
                          },
                          validator: (String? value) {
                            if (value == null || value.trim().length == 0) {
                              return 'username must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(
                              fontFamily: 'Uniform',
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(54),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: sizeAware.width * 764 / 1080,
                        height: sizeAware.height * 107 / 1920,
                        child: Consumer<Passwordvisibilty>(
                        builder: (context, passwordvisibilty, child) {
                          return TextFormField(
                            controller: passwordcontroller,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: passwordvisibilty.obscureText,
                            onChanged: (String value) {
                              print(value);
                            },
                            validator: (String? value) {
                              if (value == null || value.trim().length == 0) {
                                return " password must not be empty";
                              }
                              if (value.length < 8) {
                                return " Password is too short";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Uniform',
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                              ),
                              suffixIcon: GestureDetector(
                                    child: Icon(passwordvisibilty.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onTap: () {
                                      passwordvisibilty.eye1();
                                    },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(54),
                                ),
                              ),
                            ),
                          );
                            },
                        ),
                      ),
                       SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: sizeAware.width * 764 / 1080,
                        height: sizeAware.height * 107 / 1920,
                        child: Consumer<Passwordvisibilty>(
                          builder: (context, passwordvisibilty, child) {
                            return TextFormField(
                              controller: passworddcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: passwordvisibilty.obscureTextt,
                              validator: (String? value) {
                                if (value == null || value.trim().length == 0) {
                                  return " password must not be empty";
                                }
                                if (value.length < 8) {
                                  return " Password is too short";
                                }
                                if (passwordcontroller.value !=
                                    passworddcontroller.value) {
                                  return " password is not matching";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'confirm Password',
                                hintStyle: TextStyle(
                                  fontFamily: 'Uniform',
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                suffixIcon:  GestureDetector(
                                      child: Icon(passwordvisibilty.obscureTextt
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onTap: () {
                                        passwordvisibilty.eye();
                                      },
                                    ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(54),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 359 / 1080,
                          height: MediaQuery.of(context).size.height * 82 / 1920,
                          child: MaterialButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                emailcontrller.text;
                                namecontrller.text;
                                passwordcontroller.text;
                                passworddcontroller.text;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageScreen(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(54),
                              color: Color(0xffffee32),
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
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
