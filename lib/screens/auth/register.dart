import 'package:book_chat/screens/home/home_tabs.dart';
import 'package:book_chat/utils/responsize_funcs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:book_chat/screens/auth/login_otp.dart';
import 'package:book_chat/utils/icon_image.dart';
import 'package:book_chat/widgets/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Register extends StatefulWidget {
  static const routeName = '/register';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: isBigScreen(context) ? const Color(0xFFF9F9F9) : Colors.white,
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
                      color: Colors.white,
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ResponsiveRowColumn(
                                    layout: isBigScreen(context) ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
                                    columnCrossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const ResponsiveRowColumnItem(child: Icon(Icons.chevron_left, size: 30)),
                                      if (!isBigScreen(context))
                                        ResponsiveRowColumnItem(child: SizedBox(height: 30))
                                      else
                                        ResponsiveRowColumnItem(child: SizedBox(width: 20)),
                                      ResponsiveRowColumnItem(
                                        child: Text(
                                          'Đăng ký tài khoản',
                                          style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 28, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: isBigScreen(context) ? 40 : 70),
                              AppTextFormField(label: 'Email', validator: (txt) => txt?.isEmpty != false ? 'Required!' : null),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppTextFormField(label: 'Họ', validator: (txt) => txt?.isEmpty != false ? 'Required!' : null),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: AppTextFormField(label: 'Tên', validator: (txt) => txt?.isEmpty != false ? 'Required!' : null),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              AppTextFormField(label: 'Số điện thoại đăng ký', validator: (txt) => txt?.isEmpty != false ? 'Required!' : null),
                              const SizedBox(height: 20),
                              AppTextFormField(label: 'Mật khẩu', validator: (txt) => txt?.isEmpty != false ? 'Required!' : null),
                              const SizedBox(height: 20),
                              AppTextFormField(label: 'Nhập lại mật khẩu', validator: (txt) => txt?.isEmpty != false ? 'Required!' : null),
                              const SizedBox(height: 20),
                              Text(
                                'Khi đăng ký, bạn đồng ý với Điều khoản Sử dụng \nvà Chính sách Quyền riêng tư của Bookchat.',
                                style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              AppButton(
                                onTap: () {
                                  if (_formKey.currentState?.validate() == true) {
                                    Navigator.of(context).pushReplacementNamed(HomeTabBarWrapper.routeName);
                                  }
                                },
                                color: Theme.of(context).primaryColor,
                                text: 'Đăng ký ',
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Đã có tài khoản ? Đăng nhập tại đây.',
                                style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 16, fontWeight: FontWeight.w400),
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
