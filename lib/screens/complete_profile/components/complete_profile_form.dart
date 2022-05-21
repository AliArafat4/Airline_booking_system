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
  int Passenger_ID = 0;
  List Passengers = [];
  final List<String> errors = [];
  final List<String> thisEmail = [];
  late String emailExist = " ";
  List emails = [];

  Future<void> register_check() async {
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

  Future passenger() async {
    try {
      var url = Uri.parse("http://${ipv4}/passenger.php");

      var url_reg = Uri.parse("http://${ipv4}/email_pass_checker.php");
      var res = await http.get(url_reg);
      json.decode(res.body);
      List list_of_acc = json.decode(res.body);
      List<String> thisEmail = [];
      List<String> thisPassword = [];

      var acc_obj = json.decode(res.body)[list_of_acc.length - 1];
      thisEmail.add(acc_obj['email'.trim()]);
      thisPassword.add(acc_obj['password'.trim()]);
      emailExist = thisEmail[0];
      var response = await http.post(url, body: {
        "Fname": firstName,
        "Lname": lastName,
        "email": thisEmail[0],
        "password": thisPassword[0],
        "Phone_number": phoneNumber,
        "Nationality": nationality,
        "Passenger_ID": Passenger_ID.toString(),
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
              register_check();
              if (_formKey.currentState!.validate() &&
                  !emails.contains(emailExist)) {
                removeError(error: kEmailExist);
                passenger();
                //go to OTP
                Navigator.pushNamed(context, OtpScreen.routeName);
              } else {
                addError(error: kEmailExist);
              }
            },
          ),
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
