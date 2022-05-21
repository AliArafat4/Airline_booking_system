import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';

import '../../../size_config.dart';
import '../details_screen.dart';

class CartProductsCheck extends StatelessWidget {
  final CartController controller = Get.find();
  CartProductsCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            return CartProductCardCheck(
              controller: controller,
              product: controller.products.keys.toList()[index],
              quantity: controller.products.values.toList()[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CartProductCardCheck extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  CartProductCardCheck(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: ProductDetailsArguments(product: product),
              );
            },
            child: SizedBox(
              width: getPropertionatesScreenWidth(88),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
            ),
            // child: CircleAvatar(
            //   radius: 40,
            //   backgroundImage: AssetImage(product.images[0]),
            // ),
          ),
          SizedBox(
            width: getPropertionatesScreenWidth(20),
          ),
          Expanded(
            child: Text(product.title + "\n\$${product.price} x ${quantity}"),
          ),
          IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: Icon(
              Icons.remove_circle,
              color: kPrimaryColor,
            ),
          ),
          Text('${quantity}'),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: Icon(
              Icons.add_circle,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
