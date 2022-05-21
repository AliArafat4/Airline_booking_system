import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import '../payment/components/body.dart';

class PaymentDetailScreen extends StatelessWidget {
  static String routName = "/payment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Details",
          style: kAppBarTextColor,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
// class creditCardForm extends State<PaymentDetailScreen> {
  // final _formKey = GlobalKey<FormState>();
  // late String Card_number;
  // late String Security_code;
  // late String Fname;
  // late String Lname;
  // late String Expiry_date;
  // final List<String> errors = [];
  // Future payment() async {
  //   try {
  //     var url = Uri.parse("http://${ipv4}/payment.php");
  //     var response = await http.post(url, body: {
  //       "Card_number": Card_number,
  //       "Security_code": Security_code,
  //       "Fname": Fname,
  //       "Lname": Lname,
  //       "Expiry_date": Expiry_date,
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  // void addError({required String error}) {
  //   if (!errors.contains(error)) {
  //     setState(() {
  //       errors.add(error);
  //     });
  //   }
  // }
  //
  // void removeError({required String error}) {
  //   if (!errors.contains(error)) {
  //     setState(() {
  //       errors.remove(error);
  //     });
  //   }
  // }

//
//       ListView(
//         padding:
//             EdgeInsets.symmetric(horizontal: getPropertionatesScreenWidth(20)),
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 20),
//                   child: Text(
//                     "Add Your Payment Information",
//                     style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 21,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     vertical: getPropertionatesScreenWidth(20)),
//                 child: const Divider(),
//               ),
//               buildCardNumberFormField(),
//               SizedBox(height: getPropertionatesScreenWidth(30)),
//               // buildPasswordFormField(),
//               // SizedBox(height: getPropertionatesScreenWidth(30)),
//               // buildConfPasswordFormField(),
//               // FormError(errors: errors),
//               FormError(errors: errors),
//               SizedBox(height: getPropertionteScreenHeight(20)),
//               defultButton(
//                 text: "Purchase",
//                 press: () {
//                   // payment();
//                   print(Card_number);
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // if all are valid then go to success screen
//                     Navigator.pushNamed(
//                         context, PaymentSuccessScreen.routeName);
//                   }
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   TextFormField buildCardNumberFormField() {
//     return TextFormField(
//       onSaved: (newValue) => Card_number = newValue!,
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           removeError(error: kCardNumberNullError);
//         } else if (value.length >= 8) {
//           removeError(error: kShortCardNumberError);
//         }
//         Card_number = value;
//         return null;
//       },
//       validator: (value) {
//         if (value!.isEmpty) {
//           addError(error: kCardNumberNullError);
//           return "";
//         } else if (value.length == 12) {
//           addError(error: kShortCardNumberError);
//           return "";
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         labelText: "Card Number",
//         hintText: "Enter the card number",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         // suffixIcon: CustomSufficIcon(
//         //   svgIcon: "assets/icons/Lock.svg",
//         // ),
//       ),
//     );
//   }
}
