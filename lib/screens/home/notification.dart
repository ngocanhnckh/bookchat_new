import 'package:flutter/material.dart';

class Notification extends StatelessWidget {
  static const routeName = '/Notification';
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 24),
              IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Navigator.of(context).pop()),
              const Text('Thông báo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const Icon(Icons.search),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ...List.generate(10, (index) => const NotificationItem(title: ' mới đăng một bài viết  ', mainName: 'Người dùng')),
                const Divider(),
                const Text('Hôm qua', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ...List.generate(
                    10, (index) => const NotificationItem(title: ' đã đăng một bài viết trong Nhóm  ', mainName: 'Người dùng')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.title,
    required this.mainName,
  }) : super(key: key);
  final String title;
  final String mainName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: const Color(0xFF141414), borderRadius: BorderRadius.circular(100)),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.w700)),
                TextSpan(text: title),
              ],
              style: TextStyle(fontSize: 16, color: const Color(0xFF141414)),
            ),
          ),
        ),
        const SizedBox(width: 30),
        const Icon(Icons.more_horiz),
      ],
    );
  }
}
