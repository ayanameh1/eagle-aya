import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widget/bottonHeader.dart';
import '../homepage.dart';

class InvestStep2Screen extends StatefulWidget {
  @override
  State<InvestStep2Screen> createState() => _InvestStep2ScreenState();
}

class _InvestStep2ScreenState extends State<InvestStep2Screen> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5C0099),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left)),
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox( height: sizeAware.height * 130 / 1920),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: sizeAware.height,
                  decoration: const BoxDecoration(
                      color: Color(0xffD6D6D6),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        topLeft: Radius.circular(28),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      SizedBox(height: sizeAware.height * 90 / 1920),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            height: 200,
                            width: 300,
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
                            child: Column(
                              children: [
                                Text(
                                  'Choose booth',
                                  style: TextStyle(
                                    fontFamily: 'Uniform',
                                    fontWeight: FontWeight.bold,
                                    fontSize: sizeAware.width * 46 / 1080,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
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
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 359 / 1080,
                          height:
                              MediaQuery.of(context).size.height * 82 / 1920,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageScreen(),
                                ),
                              );
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
            ]),
          ),
        ),
        Container(
          width: sizeAware.width * 1080 / 1080,
          height: sizeAware.height * 170 / 1920,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
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
