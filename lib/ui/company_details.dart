// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_rounded),
          title: SizedBox(
            child: Image.asset('assets/images/Group 8.png'),
            width: sizeAware.width * 257 / 1080,
            height: sizeAware.height * 146 / 160,
          ),
          shadowColor: Colors.black.withOpacity(0.5),
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: CircleAvatar(
                          radius: 48,
                          backgroundImage:
                              AssetImage('assets/images/Asset 1@4x.png')),
                    ),
                    Expanded(child: Text('company name')),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff1f1f1),
                ),
                child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(22), // Creates border
                      color: Color(0xffd7d7d7),
                    ),
                    indicatorPadding: EdgeInsets.all(0),
                    labelColor: darkpurple,
                    labelStyle: TextStyle(
                        fontFamily: 'Uniform', fontWeight: FontWeight.w600),
                    isScrollable: true,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: darkpurple,
                    tabs: [
                      Tab(
                        child: Text(
                          'About',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Brochure',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Products',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Announcement',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reviews',
                        ),
                      ),
                    ]),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(children: [
                    Aboutlist(),
                    BrochureTab(),
                    productslist(),
                    AnnouncTab(),
                    Icon(Icons.directions_car, size: 350),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ABOUT TAB__________________________________________________________
class Aboutlist extends StatefulWidget {
  const Aboutlist({Key? key}) : super(key: key);

  @override
  State<Aboutlist> createState() => _AboutlistState();
}

class _AboutlistState extends State<Aboutlist> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize :MainAxisSize.min,
        children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.people_alt_outlined),
                        ),
                        Expanded(child: Text('About us')),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.email),
                        ),
                        Expanded(child: Text('email')),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.phone),
                        ),
                        Expanded(child: Text('phone')),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.local_phone_outlined),
                        ),
                        Expanded(child: Text('fax')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//PRODUCTS LIST TAB___________________________________________________
class productslist extends StatefulWidget {
  const productslist({Key? key}) : super(key: key);

  @override
  State<productslist> createState() => _productslistState();
}

class _productslistState extends State<productslist> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Card(
              child: ListTile(
                title: Text('product $i'),
                subtitle: Text('this is product $i'),
                trailing: Column(
                  children: [
                    Icon(Icons.monetization_on_outlined),
                    Text('$i'),
                  ],
                ),
                leading: CircleAvatar(
                    //radius: 60,
                    backgroundImage:
                        AssetImage('assets/images/Asset 1@4x.png')),
              ),
            ),
          );
        });
  }
}

//BROCHURE TAB________________________________________________________
class BrochureTab extends StatefulWidget {
  const BrochureTab({Key? key}) : super(key: key);

  @override
  State<BrochureTab> createState() => _BrochureTabState();
}

class _BrochureTabState extends State<BrochureTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1.0,
         // crossAxisSpacing: 2.0,
          childAspectRatio: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image(
            image: AssetImage('assets/images/kkk.png'),
          );
        });
  }
}

//ANNOUNCEMENT TAB____________________________________________________
class AnnouncTab extends StatefulWidget {
  const AnnouncTab({Key? key}) : super(key: key);

  @override
  State<AnnouncTab> createState() => _AnnouncTabState();
}

class _AnnouncTabState extends State<AnnouncTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Text('Conferences')),
        Container(
          height: MediaQuery.of(context).size.height * 45 / 160,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    decoration: BoxDecoration(border:Border(bottom: BorderSide(color: Colors.black12,width: 2))),
                    child: ListTile(
                      title: Text('product $i'),
                      subtitle: Text('this is product $i'),
                      leading: CircleAvatar(
                        //radius: 60,
                          backgroundImage:
                          AssetImage('assets/images/Asset 1@4x.png')),
                    ),
                  ),
                );
              }),
        ),
        Container(child: Text('Sales')),
        Container(
          height: MediaQuery.of(context).size.height * 45 / 160,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    decoration: BoxDecoration(border:Border(bottom: BorderSide(color: Colors.black12,width: 2))),
                    child: ListTile(
                      title: Text('product $i'),
                      subtitle: Text('this is product $i'),
                      leading: CircleAvatar(
                        //radius: 60,
                          backgroundImage:
                          AssetImage('assets/images/Asset 1@4x.png')),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
