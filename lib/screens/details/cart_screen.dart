import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';
import 'package:ics324_project/screens/payment/payment_details.dart';
import 'package:ics324_project/size_config.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'components/car_product_check_out.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController controller = Get.find();
  static String routeName = "/cart";

  late List cartItems;
  Future getTicketInfoToCart() async {
    var url = Uri.parse("http://${ipv4}/number_of_tickets.php");
    var response = await http.get(url);
    json.decode(response.body);
    List list_of_acc = json.decode(response.body);
    cartItems = [];
    int i = 0;
    while (list_of_acc.length > i) {
      cartItems.add(list_of_acc[i]);
      i++;
    }
    print(cartItems);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          title: Column(
            children: [
              Text(
                "Your Cart",
                style: kAppBarTextColor,
              ),
              Text(
                "${controller.numberOfItemsInCart} items",
                // style: Theme.of(context).textTheme.caption,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              CartProductsCheck(),
            ],
          ),
        ),
        bottomNavigationBar: CheckOurCard(),
      ),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  final CartController controller = Get.find();
  CheckOurCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getPropertionatesScreenWidth(15),
        horizontal: getPropertionatesScreenWidth(30),
      ),
      //height: 174,
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      //     boxShadow: [
      //       BoxShadow(
      //         offset: Offset(0, -15),
      //         blurRadius: 20,
      //         color: Color(0xFFDADADA).withOpacity(0.15),
      //       ),
      //     ]),
      child: SafeArea(
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Total:\n",
                  children: [
                    TextSpan(
                      text: "\$${controller.total}",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: getPropertionatesScreenWidth(190),
                child: defultButton(
                  text: "Check Out",
                  press: () {
                    if (controller.numberOfItemsInCartHomeScreen == 0) {
                    } else
                      Navigator.pushNamed(
                          context, PaymentDetailScreen.routName);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
