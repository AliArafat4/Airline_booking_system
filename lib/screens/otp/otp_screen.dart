import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "OTP Verification",
          style: kAppBarTextColor,
        ),
      ),
      body: Body(),
    );
  }
}
