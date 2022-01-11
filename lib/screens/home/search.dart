import 'package:book_chat/screens/home/search_result.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  static const routeName = '/search';
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Navigator.of(context).pop()),
                  const Text('Tìm kiếm', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  const Opacity(opacity: 0, child: Icon(Icons.search)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
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
              const SizedBox(height: 16),
              Row(
                children: const [
                  Text('Bộ lọc', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  Spacer(),
                  Text('0 tag đã chọn', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFBDBDBD))),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 15,
                children: const [
                  ChipItem(title: 'Sách'),
                  ChipItem(title: 'Nhà xuất bản'),
                  ChipItem(title: 'Tác giả'),
                  ChipItem(title: 'Nhóm'),
                  ChipItem(title: 'Sự kiện'),
                  ChipItem(title: 'Người dùng'),
                  ChipItem(title: 'Thể loại sách'),
                  ChipItem(title: 'Bài viết'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChipItem extends StatelessWidget {
  const ChipItem({Key? key, required this.title, this.onTap}) : super(key: key);
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(minWidth: (MediaQuery.of(context).size.width / 3) - 30),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(border: Border.all(color: Color(0xFF141414)), borderRadius: BorderRadius.circular(16)),
        child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
