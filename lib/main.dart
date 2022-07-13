import 'package:eagle/CN/theme.dart';
import 'package:eagle/ui/add_expo.dart';
import 'package:eagle/ui/add_expo/step1.dart';
import 'package:eagle/ui/company_details.dart';
import 'package:eagle/ui/homelayout.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/invest/step_1.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:eagle/ui/login.dart';
import 'package:eagle/ui/profile.dart';
import 'package:eagle/ui/sign_up.dart';
import 'package:eagle/ui/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   final theme= Provider.of<ThemeChanger>(context);
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     highContrastTheme: ThemeData(
       primaryColor: const Color(0xffffd100),
       primarySwatch: Colors.grey,
       scaffoldBackgroundColor: Colors.white,
       appBarTheme: const AppBarTheme(
         systemOverlayStyle: SystemUiOverlayStyle(
           statusBarColor: Colors.white,
           statusBarBrightness: Brightness.dark,
         ),
         titleSpacing: 20.0,
         backgroundColor: Colors.white,
         titleTextStyle: TextStyle(
           color: Colors.white,
           fontSize: 20.0,
           fontWeight: FontWeight.bold,
         ),
       ),
       floatingActionButtonTheme: FloatingActionButtonThemeData(
           backgroundColor: Color(0xff5C0099)),
       bottomNavigationBarTheme: BottomNavigationBarThemeData(
         type: BottomNavigationBarType.fixed,
         selectedItemColor: Color(0xffffd100),
         unselectedItemColor: Colors.grey,
         elevation: 20.0,
         backgroundColor: Colors.white,
       ),
       textTheme: const TextTheme(
           bodyText1: TextStyle(
             fontSize: 18,
             color: Colors.black,
           ),
       ),
     ),
     // darkTheme: ThemeData(
     //   scaffoldBackgroundColor: Color(0xff333039),
     //   primaryColor: const Color(0xffffd100),
     //   primarySwatch: Colors.grey,
     //   appBarTheme: const AppBarTheme(
     //     systemOverlayStyle: SystemUiOverlayStyle(
     //       statusBarColor: Color(0xff333039),
     //       statusBarBrightness: Brightness.light,
     //     ),
     //     titleSpacing: 20.0,
     //     backgroundColor: Color(0xff333039),
     //     titleTextStyle: TextStyle(
     //       color: Colors.white,
     //       fontSize: 20.0,
     //       fontWeight: FontWeight.bold,
     //     ),
     //     iconTheme: IconThemeData(color: Colors.white),
     //   ),
     //   floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xff5C0099)),
     //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     //     type: BottomNavigationBarType.fixed,
     //     selectedItemColor: Color(0xffffd100),
     //     unselectedItemColor: Colors.grey,
     //     elevation: 0.0,
     //     backgroundColor: Color(0xff333039),
     //   ),
     //   // textTheme: TextTheme(
     //   //     bodyText1: TextStyle(
     //   //       fontSize: 18,
     //   //       color: Colors.black,
     //   //         fontFamily: 'Uniform'
     //   //     )
     //   // ),
     // ),
     //theme: theme.getTheme(),
     home:  InvestStep1Screen(),
   );
  }
}
