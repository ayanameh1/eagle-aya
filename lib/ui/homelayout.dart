import 'package:eagle/CN/theme.dart';
import 'package:eagle/components/confi.dart';
import 'package:eagle/constants/colors.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/other_menu.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'add_expo/step1.dart';
import 'notification.dart';
import 'profile.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
    ChangeNotifierProvider<ThemeChanger>(
    create: (context) => ThemeChanger()),
    ],
    child: HomeLayouto());
  }
}

class HomeLayouto extends StatefulWidget {
  const HomeLayouto({Key? key}) : super(key: key);

  @override
  State<HomeLayouto> createState() => _HomeLayoutoState();
}
class _HomeLayoutoState extends State<HomeLayouto> {
  int currentIndex = 0;
  Widget currentScreen = HomePageScreen();
  final List<Widget> screens = [
    HomePageScreen(),
    NotificationScreen(),
    ProfileScreen(),
    Otherscreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    var sizeAware = MediaQuery.of(context).size;
    return Consumer<ThemeChanger>(builder: (context, mytheme, child) {
      return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            child: Image.asset('assets/images/Group 8.png'),
            width: sizeAware.width * 257 / 1080,
            height: sizeAware.height * 150 / 160,
          ),
          shadowColor: Colors.black.withOpacity(0.5),
          actions: [
            IconButton(
              onPressed: () => currentTheme.switchtheme(),
              icon: const Icon(Icons.brightness_4,),
            )
          ],
        ),
        body: screens[currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddExpoStep1Screen()));

          },
          child: Icon(
            Icons.add,
          ),
          backgroundColor:darkpurple,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffffd100),
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
                Icons.home_filled,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active_rounded,
            ),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'other'),
        ],
      ),
      );
      // PageStorage(
      //   child: currentScreen,
      //   bucket: bucket,
      // ),
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   bottomBarCenterModel: BottomBarCenterModel(
      //     centerBackgroundColor: darkpurple,
      //     centerIcon: const FloatingCenterButton(
      //       child: Icon(
      //         Icons.add,
      //         color: AppColors.white,
      //       ),
      //     ),
      //     centerIconChild: [
      //       FloatingCenterButtonChild(
      //         child: const Icon(
      //           Icons.add,
      //           color: AppColors.white,
      //         ),
      //         onTap: () {
      //           Navigator.push(context,MaterialPageRoute(builder: (context) => AddExpoStep1Screen()));
      //         },
      //       ),
      //     ],
      //   ),
      //   bottomBarItems: [
      //     //first :home
      //     BottomBarItemsModel(
      //       icon: const Icon(
      //         Icons.home,
      //         color: Colors.black,
      //       ),
      //       iconSelected: const Icon(
      //         Icons.home,
      //         //color: yellow1,
      //         // size: example.Dimens.iconNormal
      //       ),
      //       title: ('home'),
      //       dotColor: yellow1,
      //       onTap: () {
      //         setState(() {
      //           currentScreen = HomePageScreen();
      //         });
      //       },
      //     ),
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.notifications_active_rounded,
      //           color: Colors.black),
      //       iconSelected: const Icon(
      //         Icons.notifications_active_rounded,
      //         // color: yellow1,
      //         //size: example.Dimens.iconNormal
      //       ),
      //       title: ('news'),
      //       dotColor: yellow1,
      //       onTap: () {
      //         setState(() {
      //           currentScreen = NotificationScreen();
      //         });
      //       },
      //     ),
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.person, color: Colors.black),
      //       iconSelected: const Icon(
      //         Icons.person,
      //         //color: AppColors.cherryRed,
      //         //size: example.Dimens.iconNormal
      //       ),
      //       title: 'profile',
      //       dotColor: yellow1,
      //       onTap: () {
      //         setState(() {
      //           currentScreen = ProfileScreen();
      //         });
      //       },
      //     ),
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.menu, color: Colors.black),
      //       iconSelected: const Icon(
      //         Icons.menu,
      //         //color: AppColors.cherryRed,
      //         //size: example.Dimens.iconNormal
      //       ),
      //       title: 'other',
      //       dotColor: yellow1,
      //       onTap: () {
      //         setState(() {
      //           currentScreen = Otherscreen();
      //         });
      //       },
      //     ),
      //   ],
      //
      // ),

    });
  }
}
