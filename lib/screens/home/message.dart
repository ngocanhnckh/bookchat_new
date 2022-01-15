import 'package:book_chat/screens/home/search_result.dart';
import 'package:book_chat/utils/utils.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  static const routeName = '/messages';
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  const Text('Tin nhắn', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  const Icon(Icons.more_horiz),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Nhập nội dung tìm kiếm',
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
                        filled: true,
                        fillColor: const Color(0xFFF9F9F9),
                      ),
                      onSubmitted: (txt) => Navigator.of(context).pushNamed(SearchResult.routeName, arguments: txt),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () => Navigator.of(context).pushNamed(SearchResult.routeName, arguments: _controller.text),
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
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
                            ChatItem(text1: 'Người dùng', text2: 'Sunt sit ipsum nulla culpa ut non excepteur.'),
                            ChatItem(text1: 'Người dùng', text2: 'Mollit aliqua ut consectetur pariatur.'),
                            ChatItem(text1: 'Người dùng', text2: 'Ea dolor dolor labore aliqua laboris qui dolor quis '),
                            ChatItem(text1: 'Người dùng', text2: 'Amet veniam dolor officia aliqua.'),
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
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key, required this.text1, required this.text2}) : super(key: key);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black)),
                Text(text2, style: const TextStyle(fontSize: 16, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
