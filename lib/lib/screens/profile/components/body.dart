import 'package:flutter/material.dart';

import 'package:ics324_project/screens/profile/components/profile_menu.dart';

import 'package:ics324_project/screens/profile/components/profile_pic.dart';
import 'package:ics324_project/screens/sign_in/sign_in_screen.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getPropertionteScreenHeight(7),
          ),
          ProfilePic(),
          SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: "assets/icons/User Icon.svg",
            text: "My Account",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Bell.svg",
            text: "Notifications",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Settings.svg",
            text: "Setting",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Question mark.svg",
            text: "Help center",
            press: () {},
          ),
          ProfileMenu(
            icon: "assets/icons/Log out.svg",
            text: "Log Out",
            press: () => Navigator.pushNamed(context, signInScreen.routeName),
          ),
        ],
      ),
    );
  }
}
