import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/size_config.dart';
import 'package:http/http.dart' as http;
import 'otp_form.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  List emails = [];
  Future takeOTPemail() async {
    int i = 0;
    try {
      var url = Uri.parse("http://${ipv4}/email_pass_checker.php");
      var response = await http.get(url);
      json.decode(response.body);
      List list_of_acc = json.decode(response.body);
      emails = [];
      while (list_of_acc.length > i) {
        var acc_obj = json.decode(response.body)[i];
        emails.add(acc_obj['email'.trim()]);
        i++;
      }
    } catch (e) {
      print(e);
    }
  }

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
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text("OTP Verification", style: headingStyle),
              Text("We sent your code to ${emails.toString()}"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // re send OTP
                },
                child: Text("Resend OTP code",
                    style: TextStyle(decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value}".split('.')[0].padLeft(2, '0'),
            style: TextStyle(color: Colors.red),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
