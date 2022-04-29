import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:ics324_project/screens/sign_in/components/sign_form.dart';
import 'package:ics324_project/size_config.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
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
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                NoAccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
