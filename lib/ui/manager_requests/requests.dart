import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
class Requests extends StatelessWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Requestss(),
      ),
    );
  }
}

class Requestss extends StatefulWidget {
  const Requestss({Key? key}) : super(key: key);

  @override
  State<Requestss> createState() => _RequestssState();
}

class _RequestssState extends State<Requestss> {
  late TextEditingController controller;
  String reason = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Color(0xff5C0099)),
        leading: Icon(Icons.arrow_back_ios_rounded),
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 146 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/ddd.png'),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 359 / 1080,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 82 / 1920,
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,MaterialPageRoute(builder: (context) => SignUpScreen(),
                    // ),
                    // );
                  },
                  child: const Text(
                    "View Requests",
                    style: TextStyle(
                      //color: black,
                      fontFamily: 'Uniform',
                    ),
                  ),
                )),
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Card(
                      child: ListTile(
                        title: const Text('username'),
                        trailing: Column(
                          children: [
                            MaterialButton(
                                onPressed: () {},
                                child: const Text(
                                  'Accept',
                                  style: TextStyle(
                                    fontFamily: 'uniform',
                                  ),
                                )),
                            ElevatedButton(
                                onPressed: () async {
                                  final reason = await openDialog();
                                  if (reason == null || reason.isEmpty) return;
                                  setState(() => this.reason = reason);
                                },
                                child: const Text(
                                  'Refuse',
                                  style: TextStyle(
                                    fontFamily: 'uniform',
                                  ),
                                )),
                            Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'The reason of refuse:',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(reason),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        leading: const CircleAvatar(
                          //radius: 60,
                            backgroundImage:
                            AssetImage('assets/images/Asset 1@4x.png')),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Future<String?> openDialog() =>
      showDialog<String>(
        context: context,
        builder: (context) =>
         AlertDialog(
          title: Text(
            'The reason of refuse',
            style: TextStyle(
              fontFamily: 'uniform',
            ),
          ),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter the reason'),
            controller: controller,
            onSubmitted: (_)=> submit(),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('SUBMIT'),
              onPressed: submit,
            )
          ],
        ),
      );


  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }
}
