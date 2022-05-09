import 'package:flutter/material.dart';
import 'package:ics324_project/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_products.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getPropertionatesScreenWidth(20),
            ),
            Homeheader(),
            SizedBox(
              height: getPropertionatesScreenWidth(30),
            ),
            DiscountBanner(),
            SizedBox(
              height: getPropertionatesScreenWidth(30),
            ),
            SpecialOffers(),
            SizedBox(
              height: getPropertionatesScreenWidth(40),
            ),
            PopularProducts(),
            SizedBox(
              height: getPropertionatesScreenWidth(30),
            ),
          ],
        ),
      ),
    );
  }
}
