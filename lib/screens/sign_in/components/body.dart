import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ics324_project/size_config.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getPropertionatesScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: getPropertionatesScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "sign in with your email and password \nor create a new account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getPropertionatesScreenWidth(16),
                ),
              ),
              signForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class signForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: SvgPicture.asset("assets/icons/Mail.svg")),
          ),
        ],
      ),
    );
  }
}
