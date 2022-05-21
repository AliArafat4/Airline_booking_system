import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';

import 'components/body.dart';

class PaymentSuccessScreen extends StatelessWidget {
  static String routeName = "/PaymentSuccess";
  const PaymentSuccessScreen({Key? key}) : super(key: key);

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
