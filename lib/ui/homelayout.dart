import 'package:eagle/CN/theme.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/other_menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'notification.dart';
import 'profile.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  Widget currentScreen = HomePageScreen();
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
    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification!= null){
        print(message.notification!.body);
        print(message.notification!.title);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5C0099),
        title: SizedBox(
          child: Image.asset('assets/images/Group 8.png'),
          width: sizeAware.width * 257 / 1080,
          height: sizeAware.height * 150 / 160,
        ),
        shadowColor: Colors.black.withOpacity(0.5),
        actions: [
          FlatButton(
            onPressed: () => _themeChanger.setTheme2(ThemeData.dark()),
            child: FlatButton.icon(
              onPressed: () => _themeChanger.setTheme2(ThemeData.dark()),
              icon: const Icon(Icons.dark_mode_rounded),
              label: Text(''),
            ),
          ), FlatButton(
            onPressed: () => _themeChanger.setTheme1(ThemeData.light()),
            child: FlatButton.icon(
              onPressed: () => _themeChanger.setTheme1(ThemeData.light()),
              icon: const Icon(Icons.light_mode_rounded),
              label: Text(''),
            ),
          ),
        ],
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
              color: Colors.black,
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
                currentScreen = HomePageScreen();
              });
            },
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.notifications_active_rounded,
                color: Colors.black),
            iconSelected: const Icon(
              Icons.notifications_active_rounded,
              // color: yellow1,
              //size: example.Dimens.iconNormal
            ),
            title: ('news'),
            dotColor: yellow1,
            onTap: () {
              setState(() {
                currentScreen = NotificationScreen();
              });
            },
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.person, color: Colors.black),
            iconSelected: const Icon(
              Icons.person,
              //color: AppColors.cherryRed,
              //size: example.Dimens.iconNormal
            ),
            title: 'profile',
            dotColor: yellow1,
            onTap: () {
              setState(() {
                currentScreen = ProfileScreen();
              });
            },
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.menu, color: Colors.black),
            iconSelected: const Icon(
              Icons.menu,
              //color: AppColors.cherryRed,
              //size: example.Dimens.iconNormal
            ),
            title: 'other',
            dotColor: yellow1,
            onTap: () {
              setState(() {
                currentScreen = Otherscreen();
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
}
