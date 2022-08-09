import 'package:eagle/CN/theme.dart';
import 'package:eagle/components/config1.dart';
import 'package:eagle/providers/language_provider.dart';
import 'package:eagle/ui/add_expo/step1.dart';
import 'package:eagle/ui/company_details.dart';
import 'package:eagle/ui/homelayout.dart';
import 'package:eagle/ui/homepage.dart';
import 'package:eagle/ui/invest/step_1.dart';
import 'package:eagle/ui/invest/step_2.dart';
import 'package:eagle/ui/login.dart';
import 'package:eagle/ui/manage_booth.dart';
import 'package:eagle/ui/profile.dart';
import 'package:eagle/ui/sign_up.dart';
import 'package:eagle/ui/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'package:eagle/services/local_notificatios_services.dart';
import './providers/language_provider.dart';

Future<void> backgroundhandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationServices.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundhandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider()),
        ChangeNotifierProvider<ThemeChanger>(
            create: (_) => ThemeChanger(ThemeData.dark())),
      ],
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  @override
  State<MaterialAppWithTheme> createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  @override
  void initState() {
    super.initState();
    languageProvider1.addListener(() {
      print('change language');
      setState(() {});
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routFromMessage = message.data['route'];
        Navigator.of(context).pushNamed(routFromMessage);
      }
      ;
    });

    ////when app is on foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
      LocalNotificationServices.display(message);
    });

    ////when the app is on background and user taps on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routFromMessage = message.data['route'];
      print(routFromMessage);
      Navigator.of(context).pushNamed('welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Color(0xff5C0099)),
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
      initialRoute: 'home',
      routes: {
        'welcome': (context) => WelcomeScreen(),
        'login': (context) => loginscreen(),
        'signup': (context) => SignUpScreen(),
        'home': (context) => HomeLayout(),
        'Companydetails': (context) => CompanyDetails(),
        'invest': (context) => InvestStep1Screen(),
        'addexpo': (context) => AddExpoStep1Screen(),
        '1': (context) => ManageBooth(),
        //'ten': (context) => outsplashScreen(),
      },
    );
  }
}
