import 'package:flutter/material.dart';
import 'package:ics324_project/screens/complete_profile/components/body.dart';

import '../../constants.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text("Sign up"),
      ),
      body: Body(),
    );
  }
}
