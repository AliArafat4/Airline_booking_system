import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/enums.dart';
import 'package:ics324_project/screens/home/components/waitlist_passenger.dart';
import 'package:ics324_project/screens/profile/components/body.dart';

import '../../../components/custom_bottom_nav_bar.dart';
import '../admin_home_screen.dart';

class WaitlistScreen extends StatelessWidget {
  static String routeName = '/waitlist';
  const WaitlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "Reports",
          style: kAppBarTextColor,
        ),
      ),
      body: WaitlistPaaenger(),
      bottomNavigationBar: AdminBottomNavBar(selectedMenu: MenuState.waitlist),
    );
  }
}
