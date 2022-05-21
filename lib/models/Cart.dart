import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/components/defaultButton.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/screens/details/components/purchase_ticktets.dart';
import '../screens/details/components/body.dart';
import '../screens/details/components/cart_controller.dart';
import '../screens/details/details_screen.dart';
import '../size_config.dart';
import 'Product.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
// class Cart {
//   final Product product;
//   int numOfItems;
//   String type;
//   final String title;
//
//   Cart(
//       {required this.title,
//       required this.product,
//       required this.numOfItems,
//       required this.type});
//   List<Cart> demo = [];
//
//   List generateList(Product pr) {
//     demo = [
//       Cart(
//           product: pr,
//           numOfItems: getNumOfTickets(),
//           type: getTicketType().toString(),
//           title: pr.title),
//     ];
//     return demo;
//   }
// }
//
// List<Cart> demoCarts = [
//   Cart(
//       product: demoProducts[0],
//       numOfItems: getNumOfTickets(),
//       type: getTicketType().toString(),
//       title: "d"),
//   Cart(
//       product: demoProducts[1],
//       numOfItems: getNumOfTickets(),
//       type: getTicketType().toString(),
//       title: "d"),
//   Cart(
//       product: demoProducts[3],
//       numOfItems: getNumOfTickets(),
//       type: getTicketType().toString(),
//       title: "d"),
// ];

// List<String> NumItems = [];
// var Place;
// Future CurrentCartItems(String Destination) async {
//   try {
//     var url = Uri.parse("http://${ipv4}/ticket_info.php");
//     NumItems.add(Destination);
//     NumItems.add(Number_of_tiems.toString());
//     var response = await http.post(url, body: {
//       "Destination": Destination,
//       "Number_of_tiems": Number_of_tiems.toString(),
//     });
//   } catch (e) {
//     print(e);
//   }
// }

class CartProducts extends StatelessWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: demoProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return CartProductCards(index: index);
        },
      ),
    );
  }
}

class CartProductCards extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;

  CartProductCards({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       DetailsScreen.routeName,
          //       arguments:
          //           ProductDetailsArguments(product: demoProducts[index]),
          //     );
          //   },
          //   child: CircleAvatar(
          //     radius: 50,
          //     backgroundImage: AssetImage(demoProducts[index].images[0]),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments:
                    ProductDetailsArguments(product: demoProducts[index]),
              );
            },
            child: SizedBox(
              width: getPropertionatesScreenWidth(75),
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(demoProducts[index].images[0]),
                ),
              ),
            ),
          ),

          // child: AspectRatio(
          //   aspectRatio: 0.88,
          //   child: Container(
          //     padding: EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       color: Color(0xFFF5F6F9),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: Image.asset(cart.product.images[0]),
          //   ),
          // ),

          Column(
            children: [
              Text(demoProducts[index].title),
              SizedBox(
                height: 10,
              ),
              Text('\$${demoProducts[index].price} '),
            ],
          ),
          DropClassList(),
          SizedBox(
            height: getPropertionatesScreenWidth(20),
          ),

          IconButton(
            onPressed: () {
              cartController.addProduct(demoProducts[index]);
              // CurrentCartItems(demoProducts[index].title);
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

class DropClassList extends StatefulWidget {
  DropClassList({Key? key}) : super(key: key);

  @override
  State<DropClassList> createState() => _DropClassListState();
}

class _DropClassListState extends State<DropClassList> {
  final items = [
    demoProducts[0].FlightClass[0].toString(),
    demoProducts[0].FlightClass[1].toString(),
    demoProducts[0].FlightClass[2].toString(),
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        itemHeight: null,
        borderRadius: BorderRadius.circular(15),
        hint: Text("Choose Class"),
        value: value,
        items: items.map(buildMenuItem).toList(),
        onChanged: (value) => setState(() => this.value = value),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String value) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}

// late Body tic;
//
// TicketBooked x = TicketBooked(
//     product: x.product,
//     numOfItems: getNumOfTickets(),
//     type: getTicketType().toString());
//
// Cart cartItems = new Cart(
//     product: tic.getTicket(),
//     numOfItems: getNumOfTickets(),
//     type: getTicketType().toString(),
//     title: "d");
