 import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/addExpo.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/other_menu.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'notification.dart';
import 'profile.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomePageScreen(),
    ProfileScreen(),
    NotificationScreen(),
    HomePageScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  List<String> titles = [
    'Home'
    'Profile',
    'Notification',
  ];
  @override
  void initState() {
    super.initState();
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
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        //shape: CircularNotchedRectangle(),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffffee32),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              //color: AppColors.cherryRed,
              //size: example.Dimens.iconNormal
            ),
            title: 'profile',
            dotColor: yellow1,
            onTap: () {
              setState(() {
                currentScreen =ProfileScreen();
              });
            },
          ),
          BottomBarItemsModel(
            icon: const Icon(
              Icons.menu,
            ),
            iconSelected: const Icon(
              Icons.menu,
              //color: AppColors.cherryRed,
              //size: example.Dimens.iconNormal
            ),
            title: 'other',
            dotColor: yellow1,
            onTap: () {setState(() {
              currentScreen =Otherscreen();
            });
            },
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: darkpurple,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
         centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.add,
                color: AppColors.white,
              ),
              onTap: () {},
            ),
         ],
        ),
      ),
    );
  }

  Future<String> getdata() async {
    return 'create a new Expo';
  }

  void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
}
