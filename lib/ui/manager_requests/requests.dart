import 'package:eagle/components/config1.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/manager_requests/single_request_page.dart';
import 'package:flutter/material.dart';

import '../../components/confi.dart';

class ManageExpo extends StatelessWidget {
  const ManageExpo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ManageExpoQ(),
      ),
    );
  }
}

//_________________________________________________________________
class ManageExpoQ extends StatefulWidget {
  const ManageExpoQ({Key? key}) : super(key: key);

  @override
  State<ManageExpoQ> createState() => _ManageExpoQState();
}

class _ManageExpoQState extends State<ManageExpoQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded,
                color: currentTheme.isdark ? Colors.white : Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Requests',
            style: TextStyle(fontFamily: 'Uniform'),
          ),
          shadowColor: Colors.black.withOpacity(0.5),
        ),
        body: Directionality(
            textDirection:
                languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Card(
                        child: ListTile(
                          title: Text('request $i'),
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/Asset 1@4x.png')),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Singlerequest()));
                          },
                        ),
                      ),
                    );
                  }),
            )));
  }
}
