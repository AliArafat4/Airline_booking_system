import 'package:flutter/material.dart';
import '../../components/rounded_icon_btn.dart';
import '../../models/Product.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      // appBar: //CustomAppBar(arguments.product.rating),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: RoundedIconsBtn(
              IconData: Icons.arrow_back_ios,
              press: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      // body: Body(product: arguments.product),
      body: Body(
        product: arguments.product,
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
