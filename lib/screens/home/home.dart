import 'package:book_chat/screens/auth/login_mobile.dart';
import 'package:book_chat/widgets/app_buttons.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  static const routeName = '/Home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: Text('Home')),
        AppButton(text: 'Logout', onTap: () => Navigator.of(context).pushReplacementNamed(LoginMobile.routeName)),
      ],
    );
  }
}
