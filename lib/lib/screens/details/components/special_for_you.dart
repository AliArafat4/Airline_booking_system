import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/screens/details/details_screen.dart';
import '../../../models/Cart.dart';
import '../../../models/Product.dart';
import 'special_for_you_products.dart';

class SpecialForYouScreen extends StatelessWidget {
  static String routeName = '/special_for_you';
  const SpecialForYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Text(
          "Special For You",
          style: kAppBarTextColor,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: demoProducts[0]),
          );
        },
        child: ProductsForYouViewr(view: demoCarts[0]),
      ),
    );
  }
}
