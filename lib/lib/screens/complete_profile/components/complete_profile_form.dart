import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ics324_project/screens/otp/otp_screen.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/defaultButton.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String nationality;
  //PASSANGER INCEMENT
  int Passenger_ID = 1;
  final List<String> errors = [];

  Future passenger() async {
    try {
      var url = Uri.parse("http://${ipv4}/passenger.php");
      int i = 0;

      var url_reg = Uri.parse("http://${ipv4}/email_pass_checker.php");
      var res = await http.get(url_reg);
      json.decode(res.body);
      List list_of_acc = json.decode(res.body);
      List<String> thisEmail = [];
      List<String> thisPassword = [];

      var acc_obj = json.decode(res.body)[list_of_acc.length - 1];
      thisEmail.add(acc_obj['email'.trim()]);
      thisPassword.add(acc_obj['password'.trim()]);

      var response = await http.post(url, body: {
        "Fname": firstName,
        "Lname": lastName,
        "email": thisEmail[0],
        "password": thisPassword[0],
        "Phone_number": phoneNumber,
        "Nationality": nationality,
        "Passenger_ID": Passenger_ID,
      });
    } catch (e) {
      print(e);
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getPropertionteScreenHeight(30)),
          buildFirstNameFormField(),
          SizedBox(height: getPropertionteScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getPropertionteScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getPropertionteScreenHeight(30)),
          buildAdressFormField(),
          FormError(errors: errors),
          SizedBox(height: getPropertionteScreenHeight(40)),
          defultButton(
              text: "Continue",
              press: () {
                passenger();
                if (_formKey.currentState!.validate()) {
                  //go to OTP
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }
              })
        ],
      ),
    );
  }

  TextFormField buildAdressFormField() {
    return TextFormField(
      // keyboardType: TextInputType.streetAddress,
      onSaved: (newValue) => nationality = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        nationality = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nationality",
        hintText: "Enter your nationality",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufficIcon(
          svgIcon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        phoneNumber = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufficIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      // keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue!,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufficIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
      onChanged: (value) {
        lastName = value;
        return null;
      },
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      // keyboardType: TextInputType.name,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        firstName = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufficIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }
}
