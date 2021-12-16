import 'package:book_chat/screens/auth/register.dart';
import 'package:book_chat/screens/home/home_tabs.dart';
import 'package:flutter/material.dart';
import 'package:book_chat/screens/auth/login_mobile.dart';
import 'package:book_chat/screens/auth/login_otp.dart';
import 'package:book_chat/screens/auth/personal_information.dart';
import 'package:book_chat/screens/splash_screen.dart';
import 'package:book_chat/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Chat',
      theme: ThemeData(
        primarySwatch: primarySwatch,
        primaryColorDark: const Color(0xFF141414),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      routes: {
        LoginMobile.routeName: (_) => const LoginMobile(),
        Register.routeName: (_) => const Register(),
        LoginOtp.routeName: (_) => const LoginOtp(),
        LoginPersonalInfo.routeName: (_) => const LoginPersonalInfo(),
        HomeTabBarWrapper.routeName: (_) => HomeTabBarWrapper(),
      },
    );
  }
}
