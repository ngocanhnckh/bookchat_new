import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:book_chat/screens/auth/login_otp.dart';
import 'package:book_chat/utils/icon_image.dart';
import 'package:book_chat/widgets/widgets.dart';

class LoginPersonalInfo extends StatefulWidget {
  static const routeName = '/login/personalinfo';
  const LoginPersonalInfo({Key? key}) : super(key: key);

  @override
  State<LoginPersonalInfo> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginPersonalInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  Center(child: Image.asset('lib/assets/images/logo-big.png', height: 100, width: 100)),
                  const SizedBox(height: 30),
                  Text(
                    'Personal Information',
                    style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 20, fontWeight: FontWeight.w600, height: 1.5),
                  ),
                  const SizedBox(height: 25),
                  AppTextFormField(
                    label: 'Name',
                    prefixIcon: Padding(padding: const EdgeInsets.all(18), child: ImageIcon(getIconImage('person'), size: 16)),
                    validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'Email',
                    prefixIcon: Padding(padding: const EdgeInsets.all(18), child: ImageIcon(getIconImage('mail'), size: 16)),
                    validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'Date of Birth',
                    prefixIcon: Padding(padding: const EdgeInsets.all(18), child: ImageIcon(getIconImage('calendar'), size: 16)),
                    validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'City',
                    validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'Height',
                    validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Optional', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppTextFormField(
                    label: 'Weight',
                    validator: (txt) => txt?.isEmpty != false ? 'Required!' : null,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Optional', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.3))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    onTap: () {
                      if (_formKey.currentState?.validate() == true) {
                        Navigator.of(context).pushNamed(LoginOtp.routeName);
                      }
                    },
                    text: 'Save Information',
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
