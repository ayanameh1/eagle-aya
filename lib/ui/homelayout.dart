import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/addExpo.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:flutter/cupertino.dart';
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
  Widget currentScreen =HomePageScreen();

  final List<Widget> screens = [
    ProfileScreen(),
    NotificationScreen(),
    HomePageScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  List<String> titles = [
    'Profile',
    'Notrification',
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
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      bottomNavigationBar: AnimatedBottomNavigationBar(
        bottomBarItems: [

          //first :home
          BottomBarItemsModel(
            icon: const Icon(
              Icons.home,
            ),
            iconSelected: const Icon(
              Icons.home,
               //color: yellow1,
              // size: example.Dimens.iconNormal
            ),
            title: ('home'),
            dotColor: yellow1,
            onTap: () {
             setState(() {
               currentScreen =HomePageScreen();
             });
            },
          ),
          BottomBarItemsModel(
            icon: const Icon(
              Icons.notifications_active_rounded,
            ),
            iconSelected: const Icon(
              Icons.notifications_active_rounded,
              // color: yellow1,
              //size: example.Dimens.iconNormal
            ),
            title: ('news'),
            dotColor: yellow1,
            onTap: () {
              setState(() {
                currentScreen =NotificationScreen();
              });
            },
          ),
          BottomBarItemsModel(
            icon: const Icon(
              Icons.person,
            ),
            iconSelected: const Icon(
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
            onTap: () {
              //log('Profile');
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
}
