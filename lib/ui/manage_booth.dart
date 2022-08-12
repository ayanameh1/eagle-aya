import 'dart:convert';
import 'package:eagle/CN/get_investor_info_cn.dart';
import 'package:eagle/CN/get_reviews_cn.dart';
import 'package:eagle/CN/pick_single_image.dart';
import 'package:eagle/components/config1.dart';
import 'package:eagle/components/date_picker.dart';
import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import '../CN/post_review_cn.dart';
import '../models/review_comment.dart';
import 'package:numberpicker/numberpicker.dart';

class ManageBooth extends StatelessWidget {
  const ManageBooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Directionality(
        textDirection:
            languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: DefaultTabController(
          length: 5,
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<productSingleImage>(
                  create: (context) => productSingleImage()),
              ChangeNotifierProvider<ReviewPost>(
                  create: (context) => ReviewPost()),
              ChangeNotifierProvider<InvestorProfile>(
                  create: (context) => InvestorProfile()),
              ChangeNotifierProvider<GetAllReviews>(
                  create: (context) => GetAllReviews()),
            ],
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
                                    AssetImage('assets/images/download.jpg')),
                          ),
                          Expanded(
                              child: Text(
                            ' Al Durra company',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff1f1f1),
                      ),
                      child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(22), // Creates border
                            // color: Color(0xffd7d7d7),
                          ),
                          indicatorPadding: EdgeInsets.all(0),
                          labelColor: darkpurple,
                          labelStyle: TextStyle(
                              fontFamily: 'Uniform',
                              fontWeight: FontWeight.w600),
                          isScrollable: true,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: darkpurple,
                          tabs: [
                            Tab(
                              child: Text(
                                languageProvider1.getTexts('About') ?? '',
                              ),
                            ),
                            Tab(
                              child: Text(
                                languageProvider1.getTexts('Brochure') ?? '',
                              ),
                            ),
                            Tab(
                              child: Text(
                                languageProvider1.getTexts('Products') ?? "",
                              ),
                            ),
                            Tab(
                              child: Text(
                                languageProvider1.getTexts('Announcement') ??
                                    "",
                              ),
                            ),
                            Tab(
                              child: Text(
                                languageProvider1.getTexts('Reviews') ?? '',
                              ),
                            ),
                          ]),
                    ),
                    Flexible(
                      child: TabBarView(children: [
                        Aboutlist(),
                        BrochureTab(),
                        productslist(),
                        AnnouncTab(),
                        ReviewsTab(),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

//ABOUT TAB__________________________________________________________
class Aboutlist extends StatefulWidget {
  const Aboutlist({Key? key}) : super(key: key);

  @override
  State<Aboutlist> createState() => _AboutlistState();
}

class _AboutlistState extends State<Aboutlist> {
  // String phone = '123456';
  @override
  void initState() {
    super.initState();
    final informations = Provider.of<InvestorProfile>(context, listen: false);
    informations.getInvestorProfile();
  }

  @override
  Widget build(BuildContext context) {
    String phone = '123456';
    return Consumer<InvestorProfile>(builder: (context, investorpro, child) {
      return investorpro.loading
          ? SpinKitCircle(
              color: darkpurple,
            )
          : SingleChildScrollView(
              child: Directionality(
              textDirection: languageProvider1.isEn
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: Column(
                // mainAxisSize :MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child:
                                              Icon(Icons.people_alt_outlined),
                                        ),
                                        Expanded(
                                            child: Text(
                                          languageProvider1
                                                  .getTexts('About us') ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.edit,
                                            color: darkpurple,
                                          ),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text('Edit email'),
                                                      content: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        maxLines: 6,
                                                        initialValue:
                                                            investorpro
                                                                    .Ip?.body ??
                                                                "",
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'OK') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'Cancel') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(investorpro.Ip?.body ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Icon(Icons.email),
                                        ),
                                        Expanded(
                                            child: Text(
                                          languageProvider1.getTexts('email') ??
                                              "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.edit,
                                            color: darkpurple,
                                          ),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text(languageProvider1
                                                              .getTexts(
                                                                  'Edit email') ??
                                                          ''),
                                                      content: TextFormField(
                                                        initialValue: investorpro
                                                                .Ip?.title
                                                                .toString() ??
                                                            "",
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'OK') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'Cancel') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                        investorpro.Ip?.title.toString() ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Icon(Icons.phone),
                                        ),
                                        Expanded(
                                            child: Text(
                                          languageProvider1.getTexts("phone") ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.edit,
                                            color: darkpurple,
                                          ),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text(languageProvider1
                                                              .getTexts(
                                                                  'Edit phoneNumber') ??
                                                          ''),
                                                      content: TextFormField(
                                                        initialValue: investorpro
                                                                .Ip?.id
                                                                .toString() ??
                                                            "",
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'OK') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'Cancel') ??
                                                                "",
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(investorpro.Ip?.id.toString() ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child:
                                              Icon(Icons.local_phone_outlined),
                                        ),
                                        Expanded(
                                            child: Text(
                                          languageProvider1.getTexts('fax') ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.edit,
                                            color: darkpurple,
                                          ),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text(languageProvider1
                                                              .getTexts(
                                                                  'Edit fax') ??
                                                          ""),
                                                      content: TextFormField(
                                                        initialValue: investorpro
                                                                .Ip?.id
                                                                .toString() ??
                                                            "",
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'OK') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text(
                                                            languageProvider1
                                                                    .getTexts(
                                                                        'Cancel') ??
                                                                '',
                                                            style: TextStyle(
                                                                color:
                                                                    darkpurple,
                                                                fontFamily:
                                                                    'Uniform'),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ));
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(investorpro.Ip?.id.toString() ?? ""),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
    });
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
    return Directionality(
        textDirection:
            languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                indicatorColor: darkpurple,
                unselectedLabelColor: Colors.black45,
                labelStyle: TextStyle(
                    fontFamily: 'Uniform', fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    child: Text(
                      languageProvider1.getTexts('My Poducts') ?? "",
                    ),
                  ),
                  Tab(
                    child: Text(
                      languageProvider1.getTexts('Add a product') ?? "",
                    ),
                  ),
                ],
              ),
              Flexible(
                child: TabBarView(children: [
                  ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: Card(
                            child: ListTile(
                              title: Text('product $i'),
                              subtitle: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.monetization_on_outlined),
                                  Text('$i'),
                                ],
                              ),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Icon(Icons.delete,
                                        color: Colors.red[800]),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Text(languageProvider1
                                                        .getTexts('Delete') ??
                                                    ""),
                                                content: Text(
                                                    languageProvider1.getTexts(
                                                            ' Are you sure you want to delete this product?') ??
                                                        ''),
                                                actions: [
                                                  TextButton(
                                                    child: Text(
                                                      languageProvider1
                                                              .getTexts(
                                                                  'delete') ??
                                                          '',
                                                      style: TextStyle(
                                                          color: darkpurple,
                                                          fontFamily:
                                                              'Uniform'),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text(
                                                      languageProvider1
                                                              .getTexts(
                                                                  'Cancel') ??
                                                          '',
                                                      style: TextStyle(
                                                          color: darkpurple,
                                                          fontFamily:
                                                              'Uniform'),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ));
                                    },
                                  ),
                                  Icon(
                                    Icons.edit,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                  //radius: 60,
                                  backgroundImage: AssetImage(
                                      'assets/images/Asset 1@4x.png')),
                            ),
                          ),
                        );
                      }),
                  addProduct(),
                ]),
              ),
            ],
          ),
        ));
  }
}

// add a product___________________________
class addProduct extends StatefulWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  @override
  Widget build(BuildContext context) {
    return Consumer<productSingleImage>(
        builder: (context, productImage, child) {
      return Directionality(
          textDirection:
              languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageProvider1.getTexts('Product name') ?? '',
                    style: TextStyle(fontFamily: 'Uniform'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    languageProvider1.getTexts('Product price') ?? '',
                    style: TextStyle(
                      fontFamily: 'Uniform',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    languageProvider1.getTexts('Add Product photo') ?? "",
                    style: TextStyle(
                      fontFamily: 'Uniform',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          productImage.imagefromCamera();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                offset: Offset(2, 3), // Shadow position
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3,
                              color: Colors.black45,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          productImage.imagefromGallery();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2,
                                offset: Offset(2, 3), // Shadow position
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 3,
                              color: Colors.black45,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.photo,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: productImage.proimage != null
                        ? CircleAvatar(
                            radius:
                                MediaQuery.of(context).size.height * 150 / 1920,
                            backgroundImage: FileImage(productImage.proimage!)
                                as ImageProvider,
                          )
                        : CircleAvatar(
                            radius:
                                MediaQuery.of(context).size.height * 150 / 1920,
                            backgroundColor: Colors.black45,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                languageProvider1
                                        .getTexts('no image was selected') ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Uniform',
                                    color: white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            90 /
                                            1920),
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 82 / 1920,
                      child: MaterialButton(
                        onPressed: () async {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add),
                            Text(
                              languageProvider1.getTexts("add the product") ??
                                  '',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
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
                  ),
                ],
              ),
            ),
          ));
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
    return Directionality(
        textDirection:
            languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: GridView.builder(
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
            }));
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
    return Directionality(
        textDirection:
            languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                indicatorColor: darkpurple,
                unselectedLabelColor: Colors.black45,
                labelStyle: TextStyle(
                    fontFamily: 'Uniform', fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    child: Text(
                      languageProvider1.getTexts('My Announcements') ?? '',
                    ),
                  ),
                  Tab(
                    child: Text(
                      languageProvider1.getTexts('Make Announcement') ?? "",
                    ),
                  ),
                ],
              ),
              Flexible(
                child: TabBarView(children: [
                  MyAnnouncements(),
                  AddAN(),
                ]),
              ),
            ],
          ),
        ));
  }
}

//ADD ANNOUNCEMENT______________
class AddAN extends StatefulWidget {
  const AddAN({Key? key}) : super(key: key);

  @override
  State<AddAN> createState() => _AddANState();
}

class _AddANState extends State<AddAN> {
  int currentvalue = 10;
  double currentvaluee = 10;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection:
            languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      languageProvider1.getTexts('Add a sale') ?? "",
                      style: TextStyle(
                          fontFamily: 'Uniform',
                          fontSize:
                              MediaQuery.of(context).size.width * 100 / 1920),
                    ),
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: darkpurple,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: white,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                insetPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 1),
                                title: Text(
                                    languageProvider1.getTexts('Add a sale') ??
                                        ''),
                                content: StatefulBuilder(
                                    builder: (context, SBsetState) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          languageProvider1
                                                  .getTexts('Step 1') ??
                                              '',
                                          style: TextStyle(
                                              color: darkpurple,
                                              fontFamily: 'Uniform',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              60 /
                                              1920,
                                        ),
                                        Text(
                                          languageProvider1.getTexts('From') ??
                                              "",
                                          style: TextStyle(
                                            fontFamily: 'Uniform',
                                          ),
                                        ),
                                        DatePicker(),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              60 /
                                              1920,
                                        ),
                                        Text(
                                          languageProvider1.getTexts('To') ??
                                              "",
                                          style: TextStyle(
                                            fontFamily: 'Uniform',
                                          ),
                                        ),
                                        DatePicker1(),
                                        NumberPicker(
                                          minValue: 0,
                                          maxValue: 100,
                                          value: currentvalue,
                                          onChanged: (value) {
                                            setState(() {
                                              currentvalue = value;
                                              currentvaluee =
                                                  currentvaluee!.toDouble();
                                            });
                                            SBsetState(() {
                                              currentvalue = value;
                                              currentvaluee =
                                                  currentvaluee!.toDouble();
                                            });
                                            print(currentvaluee);
                                          },
                                          selectedTextStyle: TextStyle(
                                              fontSize: 30,
                                              color: Colors.deepPurple),
                                          axis: Axis.vertical,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Discount :${currentvalue} %'),
                                      ],
                                    ),
                                  );
                                }),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      languageProvider1.getTexts('Cancel') ??
                                          "",
                                      style: TextStyle(
                                          color: darkpurple,
                                          fontFamily: 'Uniform'),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      languageProvider1.getTexts('OK') ?? "",
                                      style: TextStyle(
                                          color: darkpurple,
                                          fontFamily: 'Uniform'),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      languageProvider1.getTexts('Hold a conference') ?? "",
                      style: TextStyle(
                          fontFamily: 'Uniform',
                          fontSize:
                              MediaQuery.of(context).size.width * 100 / 1920),
                    ),
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: darkpurple,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: white,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                insetPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 1),
                                title: Text(languageProvider1
                                        .getTexts('Hold a conference') ??
                                    ""),
                                content: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        languageProvider1.getTexts('Step 1') ??
                                            "",
                                        style: TextStyle(
                                            color: darkpurple,
                                            fontFamily: 'Uniform',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                60 /
                                                1920,
                                      ),
                                      Text(
                                        languageProvider1
                                                .getTexts('choose date') ??
                                            "",
                                        style: TextStyle(
                                          fontFamily: 'Uniform',
                                        ),
                                      ),
                                      DatePicker(),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                60 /
                                                1920,
                                      ),
                                      Text(
                                        languageProvider1
                                                .getTexts('choose time') ??
                                            "",
                                        style: TextStyle(
                                          fontFamily: 'Uniform',
                                        ),
                                      ),
                                      Timepicker(),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      languageProvider1.getTexts('Cancel') ??
                                          "",
                                      style: TextStyle(
                                          color: darkpurple,
                                          fontFamily: 'Uniform'),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      languageProvider1.getTexts('OK') ?? "",
                                      style: TextStyle(
                                          color: darkpurple,
                                          fontFamily: 'Uniform'),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

// MY ANNOUNCEMETS ___________________________________________________
class MyAnnouncements extends StatefulWidget {
  const MyAnnouncements({Key? key}) : super(key: key);

  @override
  State<MyAnnouncements> createState() => _MyAnnouncementsState();
}

class _MyAnnouncementsState extends State<MyAnnouncements> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection:
            languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 4 / 1000,
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width * 50 / 50,
                  child: Center(
                    child: Text(languageProvider1.getTexts('Conferences') ?? "",
                        style: TextStyle(
                            fontFamily: 'Uniform',
                            fontSize:
                                MediaQuery.of(context).size.width * 50 / 1080,
                            fontWeight: FontWeight.bold)),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 40 / 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 40 / 50,
                        height: MediaQuery.of(context).size.height * 45 / 160,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2,
                              offset: Offset(3, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: Center(child: Text('product $i')),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width * 50 / 50,
              child: Center(
                child: Text(languageProvider1.getTexts('Sales') ?? "",
                    style: TextStyle(
                        fontFamily: 'Uniform',
                        fontSize: MediaQuery.of(context).size.width * 50 / 1080,
                        fontWeight: FontWeight.bold)),
              ),
            )),
            Container(
              height: MediaQuery.of(context).size.height * 40 / 160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 40 / 50,
                        height: MediaQuery.of(context).size.height * 45 / 160,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 2,
                              offset: Offset(3, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: Center(child: Text('product $i')),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}

//REVIEWS TAB_________________________________________________________
class ReviewsTab extends StatefulWidget {
  final companyid;
  ReviewsTab({this.companyid});
  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

TextEditingController reviewcontrller = TextEditingController();

class _ReviewsTabState extends State<ReviewsTab> {
  Future getReviews() async {
    var url = '';
    var uri = Uri.parse(url);
    var data = {'companyid': widget.companyid};
    var response = await http.post(uri, body: data);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  void initState() {
    super.initState();
    final allreviews = Provider.of<GetAllReviews>(context, listen: false);
    allreviews.getallReviewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewPost>(builder: (context, reviewf, child) {
      return Consumer<GetAllReviews>(builder: (context, allReviewf, child) {
        return Directionality(
            textDirection:
                languageProvider1.isEn ? TextDirection.ltr : TextDirection.rtl,
            child: Stack(children: [
              reviewf.loading || allReviewf.loading
                  ? Container(
                      child: SpinKitCircle(
                        color: darkpurple,
                      ),
                    )
                  : ListView.builder(
                      itemCount: allReviewf.data?.length,
                      itemBuilder: (context, i) {
                        final pos = allReviewf.data;
                        final post = pos?[i];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xfff1f1f1)),
                              ),
                            ),
                            child: ListTile(
                              title: Text('${post?.username}'),
                              subtitle: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(' ${post?.body}'),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)),
                                    color: Color(0xffd7d7d7)),
                              ),
                              leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/Asset 1@4x.png')),
                            ),
                          ),
                        );
                      }),
            ]));
      });
    });
  }
}
