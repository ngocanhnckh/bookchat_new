import 'package:book_chat/screens/home/search.dart';
import 'package:book_chat/utils/utils.dart';
import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  static const routeName = '/Notification';
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Navigator.of(context).pop()),
                const Text('Thông báo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                IconButton(onPressed: () => Navigator.of(context).pushNamed(Search.routeName), icon: const Icon(Icons.search)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isBigScreen(context)) Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          Divider(),
                          Text('Hôm qua', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          Divider(),
                          Text('Hôm qua', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                          NotificationItem(text1: 'Người dùng', text2: ' mới đăng một bài viết'),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isBigScreen(context)) Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.text1, required this.text2}) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/100'), radius: 20),
          const SizedBox(width: 20),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: text1, style: const TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text: text2),
                ],
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
