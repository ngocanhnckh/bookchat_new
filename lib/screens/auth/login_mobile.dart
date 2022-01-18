import 'package:book_chat/screens/home/home_tabs.dart';
import 'package:book_chat/utils/responsize_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:book_chat/screens/auth/login_otp.dart';
import 'package:book_chat/utils/icon_image.dart';
import 'package:book_chat/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';

class LoginMobile extends StatefulWidget {
  static const routeName = '/login';
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool passVisible = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {
        user.uid;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: isBigScreen(context) ? const Color(0xFFF9F9F9) : Theme.of(context).primaryColor,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isBigScreen(context))
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/images/logo.png'),
                    const SizedBox(height: 20),
                    Text(
                      'Đăng nhập gần đây',
                      style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            children: [
                              Container(height: 144, width: 144, color: Colors.black),
                              Container(
                                color: Colors.white,
                                width: 144,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: Text(
                                  'Người dùng',
                                  style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 36),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            children: [
                              Container(height: 144, width: 144, color: Colors.black),
                              Container(
                                color: Colors.white,
                                width: 144,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                child: Text(
                                  'Người dùng',
                                  style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(isBigScreen(context) ? 16 : 0),
                    ),
                    height: isBigScreen(context) ? 690 : null,
                    width: isBigScreen(context) ? 510 : null,
                    margin: EdgeInsets.symmetric(vertical: isBigScreen(context) ? 30 : 0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 42),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: MediaQuery.of(context).padding.top + 40),
                              if (!isBigScreen(context))
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 48),
                                  child: Image.asset('lib/assets/images/logo-vertical.png'),
                                )
                              else
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Đăng nhập',
                                      style:
                                          TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 28, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              SizedBox(height: isBigScreen(context) ? 40 : 70),
                              AppTextFormField(
                                label: 'Username',
                                validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                              ),
                              const SizedBox(height: 20),
                              AppTextFormField(
                                label: 'Password',
                                validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                                obscureText: !passVisible,
                                keyboardType: TextInputType.visiblePassword,
                                prefixIcon:
                                    const Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: SizedBox(width: 24, height: 24)),
                                suffixIcon: InkWell(
                                  onTap: () => setState(() => passVisible = !passVisible),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: ImageIcon(
                                      getIconImage(passVisible ? 'eye-crossed' : 'eye'),
                                      color: Theme.of(context).primaryColorDark,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Quên mật khẩu ?',
                                style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: isBigScreen(context) ? 60 : 80),
                              AppButton(
                                onTap: () {
                                  if (_formKey.currentState?.validate() == true) {
                                    Navigator.of(context).pushReplacementNamed(HomeTabBarWrapper.routeName);
                                  }
                                },
                                color: Theme.of(context).primaryColorDark,
                                text: 'Đăng nhập',
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Hoặc đăng nhập bằng',
                                style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 16),
                              Image(image: getIconImage('google'), height: 50),
                              const SizedBox(height: 40),
                              InkWell(
                                onTap: () => Navigator.of(context).pushNamed(Register.routeName),
                                child: Text(
                                  'Chưa có tài khoản ? Đăng ký ngay.',
                                  style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
