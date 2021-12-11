import 'dart:async';

import 'package:book_chat/screens/auth/login_mobile.dart';
import 'package:flutter/material.dart';
import 'package:book_chat/widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({final Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool firstDone = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!firstDone) {
      firstDone = true;
      loadImages().then((_) => Navigator.of(context).pushReplacementNamed(LoginMobile.routeName));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AppScaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(child: Image.asset('lib/assets/images/logo-vertical.png', height: width / 1.75, width: width / 1.75)),
    );
  }

  Future<void> loadImages() {
    return Future.wait([
      Future.delayed(const Duration(seconds: 1)),
      // precacheImage(const AssetImage('lib/assets/icons/arrow-back.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/arrow-down-left.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/attachment.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/bell.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/bone-shake.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/calendar.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/call.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/camera-filled.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/camera-outlined.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/certificate.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/chat-box-bg.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/chat-box.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/chevron-double-right.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/chevron-down.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/chevron-right.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/clock-straight.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/clock.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/dollar.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/edit.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/experience-bg.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/favorite-filled.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/favorite-outlined.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/favorite-round-filled.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/favourite-round-outline.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/filter.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/folder.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/heart-beat.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/home-add.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/home.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/list.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/location-pin-filled.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/location-pin.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/magnify.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/mail.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/moon-stars.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/more.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/person-circle.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/person-dark.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/person-multiple-dark.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/person-multiple.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/person.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/phone-calling.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/plus.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/print.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/report-clock.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/scholar-hat-bg.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/send.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/star-filled.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/stethoscope.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/sun-rising.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/timer.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/tooth.png'), context),
      // precacheImage(const AssetImage('lib/assets/icons/trash-bin.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/logo-big.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/logo-small.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/onboarding-image-1.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/onboarding-image-2.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/qr-dummy.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/qr-image.png'), context),
      // precacheImage(const AssetImage('lib/assets/images/success.png'), context),
    ]);
  }
}
