import 'package:book_chat/utils/utils.dart';
import 'package:flutter/material.dart';

class Web extends StatelessWidget {
  static const routeName = '/Web';
  const Web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isBigScreen(context)) Spacer(flex: 1),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isBigScreen(context) ? 0 : 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30),
                  const Text(
                    'Khám phá mạng xã hội xung quanh bạn.',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF141414)),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 12))],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.all(30),
                          height: 270,
                          child: Text('Bạn bè'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 12))],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.all(30),
                          height: 270,
                          child: Text('Nhóm'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 12))],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.all(30),
                          height: 270,
                          child: Text('Sự kiện'),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [BoxShadow(color: Color(0x0D000000), blurRadius: 10, offset: Offset(0, 12))],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.all(30),
                          height: 270,
                          child: Text('Blog'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isBigScreen(context)) Spacer(flex: 1),
      ],
    );
  }
}
