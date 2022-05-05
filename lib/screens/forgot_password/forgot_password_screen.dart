import 'package:flutter/material.dart';
import 'package:ics324_project/screens/forgot_password/components/body.dart';

import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "Forgot password",
          style: kAppBarTextColor,
        ),
      ),
      body: Body(),
    );
  }
}
