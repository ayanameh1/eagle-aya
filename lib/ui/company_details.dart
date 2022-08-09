// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:eagle/CN/get_reviews_cn.dart';
import 'package:eagle/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

import '../CN/post_review_cn.dart';
import '../models/review_comment.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ReviewPost>(create: (context) => ReviewPost()),
          ChangeNotifierProvider<GetAllReviews>(
              create: (context) => GetAllReviews()),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            //backgroundColor: (Color(0xff5C0099)),
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
                  child: TabBarView(children: [
                    Aboutlist(),
                    BrochureTab(),
                    productslist(),
                    AnnouncTab(),
                    ReviewsTab(), //هون بتشتغلي التعليقات (الكلاس تعريفو تحت )
                  ]),
                ),
              ],
            ),
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
          Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
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
                          Expanded(
                              child: Text(
                                  'About us \nAl Durra is a family-owned manufacturing business spanning four generations. It delivers high-quality, delicious, and healthy foods.')),
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
                          Expanded(child: Text('email \n lana.ha12@gmail.com')),
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
                          Expanded(child: Text('phone\n 0938661910')),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Icon(Icons.local_phone_outlined),
                                ),
                                Expanded(child: Text('fax\n 0116124885')),
                              ],
                            ),
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
                    backgroundImage: AssetImage('assets/images/download1.jpg')),
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 4 / 1000,
        ),
        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width * 50 / 50,
              child: Center(
                child: Text('Conferences',
                    style: TextStyle(
                        fontFamily: 'Uniform',
                        fontSize: MediaQuery.of(context).size.width * 50 / 1080,
                        fontWeight: FontWeight.bold)),
              )),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 45 / 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                    child: Center(
                        child: Text(
                      'conference  $i \ntime : 3:00 Pm\n day: Sunday',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    )),
                  ),
                );
              }),
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width * 50 / 50,
          child: Center(
            child: Text('Sales',
                style: TextStyle(
                    fontFamily: 'Uniform',
                    fontSize: MediaQuery.of(context).size.width * 50 / 1080,
                    fontWeight: FontWeight.bold)),
          ),
        )),
        Container(
          height: MediaQuery.of(context).size.height * 45 / 160,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                    child: Center(
                        child: Text(
                      'we have a sale \n 70 % ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,

                      ),
                    )),
                  ),
                );
              }),
        ),
      ],
    );
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
        return Stack(children: [
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
                            bottom:
                                BorderSide(width: 1, color: Color(0xfff1f1f1)),
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
                              backgroundImage:
                                  AssetImage('assets/images/Asset 1@4x.png')),
                        ),
                      ),
                    );
                  }),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: TextFormField(
                      controller: reviewcontrller,
                      decoration: InputDecoration(
                        hintText: 'Write a review',
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: (Color(0xff5C0099)),
                          ),
                          onPressed: () async {
                            String p = reviewcontrller.text.trim();
                            Review r = Review(userId: 1, body: p);
                            await reviewf.reviewpost(r);
                            if (reviewf.isback) {
                              print('aya');
                              setState(() {
                                reviewcontrller.clear();
                              });
                              final allreviews = Provider.of<GetAllReviews>(
                                  context,
                                  listen: false);
                              allreviews.getallReviewsData();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         HomeLayout(),
                              //   ),
                              // );
                            }
                          },
                        ),
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            borderSide: BorderSide(style: BorderStyle.none)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60),
                            borderSide: BorderSide(style: BorderStyle.none)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
      });
    });
  }
}

//-----------------------------------
// class ReviewsList extends StatelessWidget {
//   final username;
//   final review;
//   ReviewsList({this.username, this.review});
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         top: 30,
//         child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height - 70,
//             child: SingleChildScrollView(
//                 child: ListTile(
//               title: Container(
//                 margin: EdgeInsets.only(top: 15),
//                 child: Text(username),
//               ),
//               subtitle: Container(
//                 padding: EdgeInsets.all(10),
//                 child: Text(review),
//                 color: Colors.grey[100],
//               ),
//               leading: CircleAvatar(
//                   //radius: 60,
//                   backgroundImage: AssetImage('assets/images/Asset 1@4x.png')),
//             ))));
//   }
// }
