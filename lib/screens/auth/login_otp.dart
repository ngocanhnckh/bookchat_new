import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:book_chat/screens/auth/personal_information.dart';
import 'package:book_chat/utils/icon_image.dart';
import 'package:book_chat/widgets/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginOtp extends StatefulWidget {
  static const routeName = '/login/otp';
  const LoginOtp({Key? key}) : super(key: key);

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('lib/assets/images/logo-big.png', height: 100, width: 100)),
                  const SizedBox(height: 30),
                  Text(
                    'OTP Verification',
                    style: TextStyle(color: Theme.of(context).primaryColorDark, fontSize: 20, fontWeight: FontWeight.w600, height: 1.5),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Verification Otp has been sent to your Mobile Number',
                    style: TextStyle(color: Color(0xFF172331), fontSize: 15, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (code) {},
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      borderWidth: 0,
                      fieldHeight: 55,
                      fieldWidth: 55,
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      selectedColor: Colors.transparent,
                      selectedFillColor: const Color(0xFFF2F2F2),
                      activeFillColor: const Color(0xFFF2F2F2),
                      inactiveFillColor: const Color(0xFFF2F2F2),
                    ),
                    textStyle: TextStyle(color: Theme.of(context).primaryColorDark),
                    enablePinAutofill: false,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    enableActiveFill: true,
                    //onCompleted: (txt) => Navigator.of(context).pushReplacementNamed(LoginPersonalInfo.routeName),
                    animationType: AnimationType.fade,
                    cursorWidth: 2,
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: 'If you don’t receive code!', style: TextStyle(color: Color(0xFF172331))),
                        TextSpan(text: ' RESEND', style: TextStyle(color: Color(0xFF00CB7F))),
                      ],
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
