import 'package:flutter/material.dart';
import 'package:ics324_project/screens/details/details_screen.dart';
import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../size_config.dart';

class ProductsForYouViewr extends StatelessWidget {
  const ProductsForYouViewr({Key? key, required this.view}) : super(key: key);
  final Cart view;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildView(),
        ],
      ),
    );
  }

  Widget buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getPropertionteScreenHeight(10),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFE7E7EF),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: getPropertionatesScreenWidth(88),
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: Container(
                      child: Image.asset(view.product.images[0]),
                    ),
                  ),
                ),
                SizedBox(
                  width: getPropertionatesScreenWidth(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      view.product.title,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "\$${view.product.price}",
                        style: TextStyle(color: kPrimaryColor),
                        children: [],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: getPropertionteScreenHeight(50),
                ),
                Text(
                  "Press to view details",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
