// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:isolate';
import 'package:eagle/CN/post_signup_cn.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/models/signup_body.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:eagle/CN/passwordvisiblity.dart';

import 'homelayout.dart';

class SignUpScreen extends StatelessWidget {
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

  @override
  validator() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not validated");
    }
  }

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => Passwordvisibilty()),
              ChangeNotifierProvider<SignupPost>(
                  create: (context) => SignupPost()),
            ],
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Consumer<SignupPost>(builder: (context, SignupPost, child) {
                  return Form(
                      key: _formkey,
                      child: SignupPost.loading
                          ? Container(
                              padding: EdgeInsets.all(20),
                              child: Center(
                                  child: SpinKitPouringHourGlassRefined(
                                color: yellow1,
                                size: MediaQuery.of(context).size.width * 500/1080,
                              )))
                          : Column(
                              children: [
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/Asset 6a.png'),
                                    width: MediaQuery.of(context).size.width * 630/1080,
                                    height: MediaQuery.of(context).size.height * 365/1920,
                                  ),
                                ),
                                Center(
                                  child: Text('Welcome',style: TextStyle(
                                    fontFamily: 'Uniform',
                                  ),),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 134/1920,
                                ),
                                Container(
                                  width: sizeAware.width * 820/1080,
                                  //height: sizeAware.height * 125 / 1920,
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
                                      if (value == null ||
                                          value.trim().length == 0) {
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
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2.5,
                                          color: Color(0xffffd100),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 50 /1920,
                                ),
                                Container(
                                  width: sizeAware.width * 820 / 1080,
                                  //height: sizeAware.height * 107 / 1920,
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
                                      if (value == null ||
                                          value.trim().length == 0) {
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
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2.5,
                                          color: Color(0xffffd100),
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 50 /1920,
                                ),
                                Container(
                                  width: sizeAware.width * 820 / 1080,
                                  //height: sizeAware.height * 107 / 1920,
                                  child: Consumer<Passwordvisibilty>(
                                    builder:
                                        (context, passwordvisibilty, child) {
                                      return TextFormField(
                                        controller: passwordcontroller,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText:
                                            passwordvisibilty.obscureText,
                                        onChanged: (String value) {
                                          print(value);
                                        },
                                        validator: (String? value) {
                                          if (value == null ||
                                              value.trim().length == 0) {
                                            return " password must not be empty";
                                          }
                                          if (value.length < 8) {
                                            return " Password is too short";
                                          }
                                          if (value.length > 12) {
                                            return " Password is too long";
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
                                            child: Icon(
                                                passwordvisibilty.obscureText
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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.5,
                                              color: Color(0xffffd100),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 50 /1920,
                                ),
                                Container(
                                  width: sizeAware.width * 820 / 1080,
                                  //height: sizeAware.height * 107 / 1920,
                                  child: Consumer<Passwordvisibilty>(
                                    builder:
                                        (context, passwordvisibilty, child) {
                                      return TextFormField(
                                        controller: passworddcontroller,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText:
                                            passwordvisibilty.obscureTextt,
                                        validator: (String? value) {
                                          if (value == null ||
                                              value.trim().length == 0) {
                                            return " password must not be empty";
                                          }
                                          if (value.length < 8) {
                                            return " Password is too short";
                                          }
                                          if (value.length > 12) {
                                            return " Password is too long";
                                          }
                                          if (passwordcontroller.value.text !=
                                              passworddcontroller.value.text) {
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
                                          suffixIcon: GestureDetector(
                                            child: Icon(
                                                passwordvisibilty.obscureTextt
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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2.5,
                                              color: Color(0xffffd100),
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 90/1920,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width * 359/1080,
                                        height:
                                            MediaQuery.of(context).size.height * 82/1920,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            if (_formkey.currentState!
                                                .validate()) {
                                              String e =
                                                  emailcontrller.text.trim();
                                              String n =
                                                  namecontrller.text.trim();
                                              String p =
                                              passwordcontroller.text;
                                              SignupBody s =
                                                  SignupBody(email: e, name: n ,password: p);
                                              await SignupPost.Signpost(s);
                                              if (SignupPost.isback) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeLayout(),
                                                  ),
                                                );
                                              }
                                              if (SignupPost.problem) {
                                                showDialog(context: context, builder: (context) => AlertDialog(
                                                  title: Text('Sorry'),
                                                  content: Text('try again'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text(
                                                        'OK',
                                                        style: TextStyle(
                                                            color: darkpurple, fontFamily: 'Uniform'),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ) );
                                              }
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
                                            borderRadius:
                                                BorderRadius.circular(54),
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
                            ));
                })),
          ),
        ),
      ),
    );
  }
}
// Future <void> regestration() async {
//   String e = emailcontrller.text.trim();
//   String n = namecontrller.text.trim();
//   String p = passwordcontroller.text.trim();
//   // passworddcontroller.text;
//   SignupBody s =
//   SignupBody(title: e, body: n);
//   var provider = Provider.of<SignupPost>(
//       context,
//       listen: false);
//   await provider.Signpost(s);
//   if (provider.isback) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             HomePageScreen(),
//       ),
//     );
//   }
// }
