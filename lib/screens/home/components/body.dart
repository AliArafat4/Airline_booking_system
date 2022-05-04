import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:ics324_project/size_config.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'icon_btn_with_counter.dart';
import 'home_header.dart';
import 'popular_products.dart';
import 'product_card.dart';
import 'search_field.dart';
import 'section_title.dart';
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
            Categories(),
            SizedBox(
              height: getPropertionatesScreenWidth(30),
            ),
            SpecialOffers(),
            SizedBox(
              height: getPropertionatesScreenWidth(30),
            ),
            PopularProducts(),
            SizedBox(
              height: getPropertionatesScreenWidth(30),
            )
          ],
        ),
      ),
    );
  }
}
