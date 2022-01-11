import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  static const routeName = '/search-result';
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String searchText = ModalRoute.of(context)!.settings.arguments as String;
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
                  const Text('Tìm kiếm', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  const Opacity(opacity: 0, child: Icon(Icons.search)),
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
                      controller: TextEditingController(text: searchText),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Nhập nội dung tìm kiếm',
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
                        filled: true,
                        fillColor: const Color(0xFFF9F9F9),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.search),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(height: 16, color: const Color(0xFFF9F9F9)),
            const SizedBox(height: 16),
            const Text('Sách', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: const [
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(height: 16, color: const Color(0xFFF9F9F9)),
            const SizedBox(height: 16),
            const Text('Tác giả', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),
            const Text(
              'Không tìm thấy kết quả',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFBDBDBD)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 12)],
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://picsum.photos/200', height: 112, width: 143, fit: BoxFit.cover),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Rừng Na-uy', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('H. Murakami', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
