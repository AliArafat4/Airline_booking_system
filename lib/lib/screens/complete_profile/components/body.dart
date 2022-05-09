import 'package:flutter/material.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/components/form_error.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/size_config.dart';

import '../../../components/custom_surfix_icon.dart';
import 'complete_profile_form.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                "Complete profile",
                style: headingStyle,
              ),
              SizedBox(height: getPropertionteScreenHeight(30)),
              Text("Complete your details"),
              CompleteProfileForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "By continuing your confirm that you agree \nwith our terms and conditions",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
