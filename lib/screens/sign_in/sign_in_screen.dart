import 'package:flutter/material.dart';

import 'components/body.dart';

class signInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  const signInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
        ),
      ),
      body: Body(),
    );
  }
}
