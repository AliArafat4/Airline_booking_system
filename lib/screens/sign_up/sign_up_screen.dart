import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';

import '../sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "Sign up",
          style: kAppBarTextColor,
        ),
      ),
      body: Body(),
    );
  }
}
