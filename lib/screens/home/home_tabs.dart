import 'package:book_chat/screens/home/home.dart';
import 'package:book_chat/screens/home/library.dart';
import 'package:book_chat/screens/home/menu.dart';
import 'package:book_chat/screens/home/notification.dart';
import 'package:book_chat/screens/home/web.dart';
import 'package:book_chat/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Notification;

import '../../../utils/icon_image.dart';
import '../../widgets/app_scaffold.dart';

class HomeTabBarWrapper extends StatelessWidget {
  static const String routeName = '/home';

  HomeTabBarWrapper({final Key? key}) : super(key: key);

  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  final PageController pageController = PageController();

  void changePage(final int val) {
    currentPage.value = val;
    pageController.jumpToPage(val);
  }

  @override
  Widget build(final BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.black.withOpacity(0.05), blurRadius: 10)],
            ),
            alignment: Alignment.center,
            child: SafeArea(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.asset('lib/assets/images/logo.png', height: 35),
                  ),
                  const Spacer(),
                  if (isBigScreen(context)) SizedBox(width: mediaQuery.size.width / 2, height: 51, child: tabs()),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: mediaQuery.size.width,
                  padding: EdgeInsets.only(bottom: 72 + mediaQuery.viewPadding.bottom),
                  color: const Color(0xFFF9F9F9),
                  child: PageView(
                    scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
                    onPageChanged: (final int page) => currentPage.value = page,
                    controller: pageController,
                    children: const <Widget>[Home(), Web(), Library(), Notification(), Menu()],
                  ),
                ),
                if (!isBigScreen(context))
                  Positioned(bottom: 0, width: mediaQuery.size.width, height: 72 + mediaQuery.viewPadding.bottom, child: tabs()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabs() {
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (final __, final int page, final _) => Row(
        children: <Widget>[
          Expanded(child: BottomBarIcon(onTap: () => changePage(0), selected: page == 0, image: getIconImage('home'), isFirst: true)),
          Expanded(child: BottomBarIcon(onTap: () => changePage(1), selected: page == 1, image: getIconImage('language'))),
          Expanded(child: BottomBarIcon(onTap: () => changePage(2), selected: page == 2, image: getIconImage('bookmark'))),
          Expanded(child: BottomBarIcon(onTap: () => changePage(3), selected: page == 3, image: getIconImage('notification'))),
          Expanded(child: BottomBarIcon(onTap: () => changePage(4), selected: page == 4, image: getIconImage('menu'), isLast: true)),
        ],
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    required final this.onTap,
    required final this.selected,
    required final this.image,
    final this.disabled = false,
    this.isFirst = false,
    this.isLast = false,
    final Key? key,
  }) : super(key: key);

  final void Function() onTap;
  final bool selected;
  final ImageProvider image;
  final bool disabled;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: disabled ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: isFirst && !isBigScreen(context) ? const Radius.circular(16) : Radius.zero,
              topRight: isLast && !isBigScreen(context) ? const Radius.circular(16) : Radius.zero,
              bottomLeft: isFirst && isBigScreen(context) ? const Radius.circular(16) : Radius.zero,
              bottomRight: isLast && isBigScreen(context) ? const Radius.circular(16) : Radius.zero,
            ),
            color: selected ? Colors.white : Theme.of(context).primaryColor,
          ),
          alignment: Alignment.center,
          child: Opacity(
            opacity: disabled ? 0.6 : 1,
            child: Stack(children: <Widget>[Padding(padding: const EdgeInsets.all(3), child: ImageIcon(image))]),
          ),
        ),
      );
}
