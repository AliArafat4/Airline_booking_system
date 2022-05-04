import 'package:flutter/material.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/components/form_error.dart';
import 'package:ics324_project/screens/sign_up/components/sign_up_form.dart';
import 'package:ics324_project/size_config.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getPropertionatesScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Complete your details to create \na new account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              SignUpForm(),
              SizedBox(height: getPropertionteScreenHeight(60)),
              Text(
                "By continuing your confirm that you agree \nwith our terms and conditions",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
