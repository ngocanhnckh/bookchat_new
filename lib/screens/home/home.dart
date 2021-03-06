import 'package:book_chat/screens/auth/login_mobile.dart';
import 'package:book_chat/screens/home/message.dart';
import 'package:book_chat/screens/home/search.dart';
import 'package:book_chat/utils/utils.dart';
import 'package:book_chat/widgets/app_buttons.dart';
import 'package:book_chat/widgets/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final adViewController = PageController();
  double currentDot = 0;
  @override
  void initState() {
    adViewController.addListener(() {
      setState(() {
        currentDot = adViewController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!isBigScreen(context))
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
                  IconButton(onPressed: () => Navigator.of(context).pushNamed(Search.routeName), icon: const Icon(Icons.search)),
                  IconButton(onPressed: () => Navigator.of(context).pushNamed(Messages.routeName), icon: const Icon(Icons.chat_bubble_outline)),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isBigScreen(context))
              Expanded(
                flex: 1,
                child: Column(
                  children: const [Text('Profile')],
                ),
              ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: !isBigScreen(context) ? BorderRadius.zero : BorderRadius.circular(16),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 180,
                          child: PageView.builder(
                            scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
                            controller: adViewController,
                            itemCount: 5,
                            itemBuilder: (ctx, index) => Container(
                              child: Image.network('https://picsum.photos/${500 + index}', fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        DotsIndicator(dotsCount: 5, position: currentDot)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          20,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network('https://picsum.photos/${100 + index}', height: 40, width: 40),
                                ),
                                SizedBox(height: 16),
                                Text('John'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 12))],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network('https://picsum.photos/300', height: 40, width: 40),
                        ),
                        const SizedBox(width: 15),
                        const Expanded(child: AppTextFormField(label: 'What\'s on your mind ?')),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 12))],
                      borderRadius: BorderRadius.circular(16),
                    ),
                  )
                ],
              ),
            ),
            if (isBigScreen(context))
              Expanded(
                flex: 1,
                child: Column(
                  children: const [Text('Danh s??ch li??n l???c')],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
