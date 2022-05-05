import 'package:flutter/material.dart';

import '../../../components/rounded_icon_btn.dart';
import '../../../constants.dart';
import '../../../enums.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getPropertionatesScreenWidth(20)),
      child: Row(
        children: [
          CustomClassType(
            press: () {
              TextStyle(color: Colors.red);
            },
          ),
          Spacer(),
          RoundedIconsBtn(IconData: Icons.remove, press: () {}),
          SizedBox(width: getPropertionatesScreenWidth(20)),
          RoundedIconsBtn(
            IconData: Icons.add,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CustomClassType extends StatelessWidget {
  const CustomClassType({
    Key? key,
    required this.press,
  }) : super(key: key);

  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      child: Column(
        children: [
          TextButton(
            onPressed: press,
            child: Text(
              "First Class",
              style: TextStyle(color: inActiveIconColor),
            ),
          ),
          Text(
            "Business Class",
            style: TextStyle(color: inActiveIconColor),
          ),
          Text(
            "Economic Class",
            style: TextStyle(color: inActiveIconColor),
          ),
        ],
      ),
    );
  }
}
