import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/models/Cart.dart';
import 'package:ics324_project/size_config.dart';

import '../../constants.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: kAppBarTextColor,
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckOurCard(),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            ),
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "\$337.15",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getPropertionatesScreenWidth(190),
              child: defultButton(
                text: "Check Out",
                press: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
