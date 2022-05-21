import 'package:flutter/material.dart';
import 'package:ics324_project/screens/payment_success/payment_success_screens.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/defaultButton.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class PaymentForm extends StatefulWidget {
  static String routName = "/payment";

  var controller;

  @override
  creditCardForm createState() => creditCardForm();
}

class creditCardForm extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();

  late String Card_number;
  late String Security_code;
  late String Fname;
  late String Lname;
  late String Expiry_date;
  final List<String> errors = [];
  Future payment() async {
    try {
      var url = Uri.parse("http://${ipv4}/credit_card_info.php");
      var response = await http.post(url, body: {
        "Card_number": Card_number,
        "Security_code": Security_code,
        "Fname": Fname,
        "Lname": Lname,
        "Expiry_date": Expiry_date,
      });
    } catch (e) {
      print(e);
    }
  }

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildCardNumberFormField(),
          SizedBox(height: getPropertionteScreenHeight(20)),
          buildSecurityNumberFormField(),
          SizedBox(height: getPropertionteScreenHeight(20)),
          buildFnameFormField(),
          SizedBox(height: getPropertionteScreenHeight(20)),
          buildLnameFormField(),
          SizedBox(height: getPropertionteScreenHeight(20)),
          buildExpiryDateFormField(),
          FormError(errors: errors),
          SizedBox(height: getPropertionteScreenHeight(18)),
          defultButton(
            text: "Purchase",
            press: () {
              if (_formKey.currentState!.validate() &&
                  Expiry_date.indexOf('/') == 2) {
                _formKey.currentState!.save();
                payment();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, PaymentSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  TextFormField buildCardNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => Card_number = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kCardNumberNullError);
        } else if (value.length != 12) {
          removeError(error: kShortCardNumberError);
        }
        Card_number = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kCardNumberNullError);
          return "";
        } else if (value.length != 12) {
          addError(error: kShortCardNumberError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Card Number",
        hintText: "Enter the card number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSufficIcon(
        //   svgIcon: "assets/icons/Lock.svg",
        // ),
      ),
    );
  }

  @override
  TextFormField buildSecurityNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => Security_code = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kSecurityNumberNullError);
        } else if (value.length == 3) {
          removeError(error: kShortSecurityNumberError);
        }
        Security_code = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kSecurityNumberNullError);
          return "";
        } else if (value.length != 3) {
          addError(error: kShortSecurityNumberError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Security Number",
        hintText: "Enter the security number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSufficIcon(
        //   svgIcon: "assets/icons/Lock.svg",
        // ),
      ),
    );
  }

  @override
  TextFormField buildFnameFormField() {
    return TextFormField(
      onSaved: (newValue) => Fname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kFNamelNullError);
        }
        Fname = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kFNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSufficIcon(
        //   svgIcon: "assets/icons/Lock.svg",
        // ),
      ),
    );
  }

  @override
  TextFormField buildLnameFormField() {
    return TextFormField(
      onSaved: (newValue) => Lname = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLNamelNullError);
        }
        Lname = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kLNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSufficIcon(
        //   svgIcon: "assets/icons/Lock.svg",
        // ),
      ),
    );
  }

  @override
  TextFormField buildExpiryDateFormField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      onSaved: (newValue) => Expiry_date = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kExpiryDateNullError);
        } else if (value.length == 5) {
          removeError(error: kShortExpiryDateError);
        }
        if (value.length == 5 && value.indexOf('/') == 2) {
          removeError(error: kExpiryDateFormatError);
        }
        Expiry_date = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kExpiryDateNullError);
          return "";
        } else if (value.length < 5 && value.indexOf('/') != 2) {
          addError(error: kExpiryDateFormatError);
          return "";
        } else if (value.length != 5) {
          addError(error: kShortExpiryDateError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Expire Date",
        hintText: "Enter the expire date (MM/YY)",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSufficIcon(
        //   svgIcon: "assets/icons/Lock.svg",
        // ),
      ),
    );
  }
}
