import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/models/Cart.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:ics324_project/screens/details/components/purchase_ticktets.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';

import '../../../size_config.dart';

import '../cart_screen.dart';
import '../details_screen.dart';
import 'cart_controller.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'package:http/http.dart' as http;

class Body extends StatelessWidget {
  final cartController = Get.put(CartController());

  late String Time;
  late double Weight;
  late String Flight_date;
  late double Price;
  late String Type;
  late int Validity_period;
  late int Flight_number;
  late String Destination;

  Future<void> TicketInfo() async {
    var url = Uri.parse("http://${ipv4}/ticket_info.php");
    var response = await http.post(url, body: {
      "Time": Time,
      "Weight": Weight.toString(),
      "Flight_date": Flight_date,
      "Price": Price.toString(),
      "Type": Type,
      "Validity_period": Validity_period.toString(),
      "Flight_number": Flight_number.toString(),
      "Destination": Destination,
    });
  }

  Body({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Flexible(
      child: ListView.builder(
        itemCount: demoProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return PuplarFlights(
            product: demoProducts[index],
            index: index,
          );
        },
      ),
    );
  }
}

class PuplarFlights extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;

  Product product;

  PuplarFlights({Key? key, required this.index, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getPropertionteScreenHeight(3),
          ),
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      PurchaseTickts(),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getPropertionatesScreenWidth(40),
                            top: getPropertionatesScreenWidth(15),
                          ),
                          child: defultButton(
                              text: "Add item to cart",
                              press: () {
                                cartController.addProduct(demoProducts[index]);
                                Navigator.pushNamed(
                                    context, CartScreen.routeName);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
