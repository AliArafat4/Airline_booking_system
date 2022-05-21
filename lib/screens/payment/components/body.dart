import 'package:flutter/material.dart';
import 'package:ics324_project/screens/payment/components/payment_form.dart';
import 'package:ics324_project/screens/sign_in/components/sign_form.dart';
import 'package:ics324_project/size_config.dart';
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
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Add Your Payment Information",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getPropertionatesScreenWidth(20)),
                ),
                PaymentForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
