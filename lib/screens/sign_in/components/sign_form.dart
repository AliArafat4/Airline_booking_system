import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ics324_project/screens/forgot_password/forgot_password_screen.dart';
import 'package:ics324_project/screens/home/admin_home_screen.dart';
import 'package:ics324_project/screens/login_success/login_success_screens.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/defaultButton.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  @override
  signFormState createState() => signFormState();
}

class signFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];
  List emails = [];
  List passwords = [];

  Future<void> login_check() async {
    int i = 0;
    try {
      var url = Uri.parse("http://${ipv4}/email_pass_checker.php");
      var response = await http.get(url);
      json.decode(response.body);
      List list_of_acc = json.decode(response.body);
      emails = [];
      passwords = [];
      while (list_of_acc.length > i) {
        var acc_obj = json.decode(response.body)[i];
        emails.add(acc_obj['email'.trim()]);
        passwords.add(acc_obj['password'.trim()]);
        i++;
      }
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
          buildEmailFormField(),
          SizedBox(height: getPropertionteScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getPropertionteScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getPropertionteScreenHeight(20)),
          defultButton(
            text: "Continue",
            press: () {
              login_check();
              if (_formKey.currentState!.validate() &&
                  email.contains("admin")) {
                Navigator.pushNamed(context, AdminHomeScreen.routeName);
              }
              if (_formKey.currentState!.validate() &&
                  emails.contains(email) &&
                  passwords[emails.indexOf(email)] == password) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufficIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSufficIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
