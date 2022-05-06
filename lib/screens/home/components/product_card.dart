import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRation = 1.02,
    required this.product,
    required this.press,
  }) : super(key: key);

  final double width, aspectRation;
  final Product product;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getPropertionatesScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getPropertionatesScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRation,
                child: Container(
                  padding: EdgeInsets.all(
                    getPropertionatesScreenWidth(20),
                  ),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.images[0]),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getPropertionatesScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
