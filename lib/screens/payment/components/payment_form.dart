import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';
import 'package:ics324_project/screens/payment_success/payment_success_screens.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/defaultButton.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

import '../../details/components/car_product_check_out.dart';

class PaymentForm extends StatefulWidget {
  static String routName = "/payment";

  @override
  creditCardForm createState() => creditCardForm();
}

class creditCardForm extends State<PaymentForm> {
  CartController controller = Get.find();
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
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future UpdateCard() async {
    try {
      var url = Uri.parse("http://${ipv4}/passenger_card_update.php");
      var response = await http.post(url, body: {
        "Card_number": Card_number,
        "Fname": Fname,
        "Lname": Lname,
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String nationality;
  late String emailExist = " ";
  List emails = [];
  List<String> thisEmail = [];
  List<String> thisPassword = [];
  int Passenger_ID = 0;

  Future PassengerUpdate() async {
    try {
      var url = Uri.parse("http://${ipv4}/passenger.php");

      var url_reg = Uri.parse("http://${ipv4}/email_pass_checker.php");
      var res = await http.get(url_reg);
      json.decode(res.body);
      List list_of_acc = json.decode(res.body);
      thisEmail = [];
      thisPassword = [];

      var acc_obj = json.decode(res.body)[list_of_acc.length - 1];
      thisEmail.add(acc_obj['email'.trim()]);

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
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  List FnameGet = [];
  List LnameGet = [];
  Future GetNames() async {
    int i = 0;
    try {
      var url = Uri.parse("http://${ipv4}/get_passenger_name.php");
      var response = await http.get(url);
      json.decode(response.body);
      List list_of_acc = json.decode(response.body);
      FnameGet = [];
      LnameGet = [];
      while (list_of_acc.length > i) {
        var acc_obj = json.decode(response.body)[i];
        FnameGet.add(acc_obj['Fname'.trim()]);
        LnameGet.add(acc_obj['Lname'.trim()]);
        i++;
      }
      // print(FnameGet);
      // print(LnameGet);
    } catch (e) {
      print(e);
    }
  }

  Future PurshacedTickets(String Passenger_Name) async {
    try {
      var url = Uri.parse("http://${ipv4}/purchased_tickets.php");
      var response = await http.post(url, body: {
        "Passenger_Name": Passenger_Name,
        "Flight_number": 0.toString(),
        "Number_of_tickets": controller.numberOfItemsInCart.toString(),
        "Class": demoProducts[0].FlightClass[0].toString(),
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  // late List FlightTitleList = [];
  // late List FlightIDList = [];
  // Future GetFlightID() async {
  //   late int i = 0;
  //   var url = Uri.parse("http://${ipv4}/number_of_tickets.php");
  //   var response = await http.get(url);
  //   json.decode(response.body);
  //
  //   List list_of_acc = json.decode(response.body);
  //   while (list_of_acc.length > i) {
  //     var acc_obj = json.decode(response.body)[i];
  //     FlightTitleList.add(acc_obj['Destination'.trim()]);
  //     // FlightType.add(acc_obj[]);
  //     FlightIDList.add(acc_obj['Flight_number'.trim()]);
  //     i++;
  //   }
  //   return FlightIDList;
  // }

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
    final CartController controller = Get.find();
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
          Text(
            "Total is \$${controller.total}",
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Obx(() =>
              Text("Total after discount is \$${controller.discountedtotal}")),
          defultButton(
              text: "Purchase",
              press: () {
                // GetFlightID();
                // print(controller.);
                // String FlightID =
                //     FlightIDList[FlightTitleList.indexOf(controller.products)];
                if (_formKey.currentState!.validate() &&
                    Expiry_date.indexOf('/') == 2) {
                  _formKey.currentState!.save();
                  GetNames();
                  payment();
                  PurshacedTickets(Fname);
                  UpdateCard();
                  Navigator.pushNamed(context, PaymentSuccessScreen.routeName);
                  // if (FnameGet.contains(Fname)) {
                  //   // if (LnameGet[FnameGet.indexOf(Fname)] == Lname) {
                  //   //   //put error not found
                  //   //   // payment();
                  //   //   // PurshacedTickets(Fname + Lname);
                  //   //   // UpdateCard();
                  //   //   // Navigator.pushNamed(
                  //   //   //     context, PaymentSuccessScreen.routeName);
                  //   // }
                  // }
                }

                // if all are valid then go to success screen
              }),
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
