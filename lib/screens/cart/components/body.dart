import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ics324_project/models/Cart.dart';
import 'package:ics324_project/size_config.dart';
import 'cart_item_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getPropertionatesScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: ((context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(
                  //check this it should be product.id.toString()
                  demoCarts[index].product.toString(),
                ),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg")
                    ],
                  ),
                ),
                onDismissed: (directory) {
                  setState(() {
                    demoCarts.removeAt(index);
                  });
                },
                child: CartItemCard(cart: demoCarts[index]),
              ),
            )),
      ),
    );
  }
}
