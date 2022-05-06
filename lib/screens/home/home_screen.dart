import 'package:flutter/material.dart';
import 'package:ics324_project/components/custom_bottom_nav_bar.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        toolbarHeight: 0,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
