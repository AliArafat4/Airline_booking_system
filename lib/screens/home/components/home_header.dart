import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

import '../../details/cart_screen.dart';
import '../../details/components/cart_controller.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class Homeheader extends StatelessWidget {
  Homeheader({
    Key? key,
  }) : super(key: key);
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getPropertionatesScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SearchField(),
          Obx(
            () => IconBtnWithCounterr(
                svgSrc: "assets/icons/Cart Icon.svg",
                numOfItems: controller.numberOfItemsInCartHomeScreen,
                press: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                }),
          ),

          IconBtnWithCounterr(
            svgSrc: "assets/icons/Bell.svg",
            numOfItems: 3,
            press: () {
              //WAITLIST (MAYBE)
            },
          ),
        ],
      ),
    );
  }
}
