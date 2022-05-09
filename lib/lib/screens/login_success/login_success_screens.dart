import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';

import '../login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/Login_Success";
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: kAppBarColor,
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}
