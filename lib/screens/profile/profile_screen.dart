import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/enums.dart';
import 'package:ics324_project/screens/profile/components/body.dart';

import '../../components/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "Profile",
          style: kAppBarTextColor,
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
