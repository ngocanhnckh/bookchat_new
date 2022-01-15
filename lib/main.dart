import 'package:book_chat/screens/auth/register.dart';
import 'package:book_chat/screens/home/home_tabs.dart';
import 'package:book_chat/screens/home/message.dart';
import 'package:book_chat/screens/home/search.dart';
import 'package:book_chat/screens/home/search_result.dart';
import 'package:flutter/gestures.dart';
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
      builder: (ctx, child) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
        child: child ?? Container(),
      ),
      routes: {
        LoginMobile.routeName: (_) => ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
              child: const LoginMobile(),
            ),
        Register.routeName: (_) => ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
              child: const Register(),
            ),
        LoginOtp.routeName: (_) => ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
              child: const LoginOtp(),
            ),
        LoginPersonalInfo.routeName: (_) => ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
              child: const LoginPersonalInfo(),
            ),
        HomeTabBarWrapper.routeName: (_) => ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
              child: HomeTabBarWrapper(),
            ),
        Search.routeName: (_) => const Search(),
        SearchResult.routeName: (_) => const SearchResult(),
        Messages.routeName: (_) => const Messages(),
      },
    );
  }
}
