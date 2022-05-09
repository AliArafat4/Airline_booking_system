import 'package:flutter/material.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/screens/home/home_screen.dart';
import 'package:ics324_project/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: SizeConfig.screenHeight * 0.2,
        ),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.25,
        ),
        SizedBox(height: getPropertionteScreenHeight(20)),
        Text(
          "Login successfully",
          style: TextStyle(
              fontSize: getPropertionatesScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: defultButton(
            text: ("Continue"),
            press: () => Navigator.pushNamed(context, HomeScreen.routName),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
