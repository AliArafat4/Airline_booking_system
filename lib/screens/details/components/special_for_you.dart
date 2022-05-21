import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/screens/details/cart_screen.dart';
import 'package:ics324_project/screens/details/details_screen.dart';
import '../../../models/Cart.dart';
import '../../../models/Product.dart';
import 'special_for_you_products.dart';
import 'package:http/http.dart' as http;

class SpecialForYouScreen extends StatelessWidget {
  static String routeName = '/special_for_you';
  const SpecialForYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "Available Flights",
          style: kAppBarTextColor,
        ),
      ),
      body: SafeArea(
        // child: GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       DetailsScreen.routeName,
        //       arguments: ProductDetailsArguments(product: demoProducts[0]),
        //     );
        //   },
        // ),
        child: CartProducts(),
      ),
      bottomNavigationBar: defultButton(
        text: 'View Cart',
        press: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
    );
  }
}
