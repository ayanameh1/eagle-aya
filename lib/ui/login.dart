// ignore_for_file: prefer_const_constructors

import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/homelayout.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:eagle/CN/passwordvisiblity.dart';

class loginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return login1screen();
  }
}

class login1screen extends StatefulWidget {
  @override
  State<login1screen> createState() => _login1screenState();
}

class _login1screenState extends State<login1screen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontrller = TextEditingController();
  TextEditingController passworddcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    List<Bcard> cards = [
      Bcard(
          photoname: 'assets/images/asset 1a.png',
          description: 'way to meet, communicate,\n share and compete '),
      Bcard(
          photoname: 'assets/images/Asset 4a.png',
          description:
              'marketing for your work with\n the advantage of holding a\n conference to promote\n yourself .'),
      Bcard(
          photoname: 'assets/images/Asset 1.png',
          description:
              'way to walk around the\n exhibition and keep up with the\n latest news and the biggest\n sales .')
    ];

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
          child: ChangeNotifierProvider<Passwordvisibilty>(
            create: (context) => Passwordvisibilty(),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1717 / 1920,
                child: Form(
                  key: _formkey,
                  child: Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Swiper(
                            containerHeight:
                                MediaQuery.of(context).size.height * 898 / 1080,
                            itemCount: cards.length,
                            itemBuilder: (context, index) {
                              return Bcard(
                                photoname: cards[index].photoname,
                                description: cards[index].description,
                              );
                            },
                            //control: SwiperControl(),
                            pagination: SwiperPagination(),
                          ),
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
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(54),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
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
                                controller:passworddcontroller ,
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
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                        passwordvisibilty.obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                    color: Colors.grey,),
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
                          height: sizeAware.height * 39 / 1920,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                fontFamily: 'Uniform',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Signup here',
                                style: TextStyle(
                                  color: Color(0xff5C0099),
                                  fontFamily: 'Uniform',
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 359 / 1080,
                          height: MediaQuery.of(context).size.height * 82 / 1920,
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                String e = passworddcontroller.text.trim();
                                String n = emailcontrller.text.trim();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeLayout(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              "Login",
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
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 80 / 1920,
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width * 359 / 1080,
                          height: MediaQuery.of(context).size.height * 82 / 1920,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}

// cards
class Bcard extends StatefulWidget {
  Bcard({Key? key, required this.photoname, required this.description})
      : super(key: key);

  final String photoname;
  final String description;
  @override
  _BcardState createState() => _BcardState();
}

class _BcardState extends State<Bcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image(
            image: AssetImage(widget.photoname),
            width: MediaQuery.of(context).size.width * 600 / 1080,
            height: MediaQuery.of(context).size.height * 600 / 1920,
          ),
          // ignore: prefer_const_constructors
          Text(
            'Quick & easy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Uniform',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 50 / 1920,
          ),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Uniform',
            ),
          ),
        ],
      ),
    );
  }
}
