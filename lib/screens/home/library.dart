import 'package:book_chat/screens/home/search.dart';
import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  static const routeName = '/Library';
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF9F9F9),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 8, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Navigator.of(context).pop()),
                  const Text('Thư viện sách', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  IconButton(onPressed: () => Navigator.of(context).pushNamed(Search.routeName), icon: const Icon(Icons.search)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Tủ sách của bạn', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                      SizedBox(height: 27),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Khám phá thư viện', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(color: Color(0xFF5BCDF6), borderRadius: BorderRadius.circular(14)),
                                ),
                                SizedBox(width: 10),
                                Expanded(child: Text('Tác giả A mới ra mắt sách', style: TextStyle(color: Color(0x40141414)))),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  height: 14,
                                  width: 14,
                                  decoration: BoxDecoration(color: Color(0xFF5BCDF6), borderRadius: BorderRadius.circular(14)),
                                ),
                                SizedBox(width: 10),
                                Expanded(child: Text('03 sách mới từ tác giả bạn theo dõi', style: TextStyle(color: Color(0x40141414)))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
