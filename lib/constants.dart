import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Colors.lightBlue;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF55BEEB), Color(0xFF64CDD4)],
);

const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final kAppBarColor = Colors.blue[500];
const kAppBarTextColor = TextStyle(color: Colors.white);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: getPropertionatesScreenWidth(28),
  color: Colors.black,
  height: 1.5,
);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-p]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter Your Email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Password don't match";

const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getPropertionatesScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getPropertionatesScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
