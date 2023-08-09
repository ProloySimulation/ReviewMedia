import 'package:flutter/material.dart';
import 'package:review/mainscreen/login/otp_screen.dart';
import 'package:review/mainscreen/homePage.dart';
import 'package:review/mainscreen/profile/edit_profile.dart';
import 'package:review/util/SharedPreferences.dart';

import 'mainscreen/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String? userToken;

  @override
  void initState() {
    super.initState();
    checkUserId();
  }

  Future<void> checkUserId() async {
    WidgetsFlutterBinding.ensureInitialized();
    /*setState(() {
      userToken = getTokenPreferences('userId') as String;
      print("Hello $userToken");
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: userToken !=null ? '/' : '/home',
      routes:
      {
        '/' : (context) => LoginScreen(),
        '/otp' : (context) => OtpScreen(),
        '/home' : (context) => HomePage(),
        '/editProfile':(context) => EditProfile(),
      },
    );
  }
}

