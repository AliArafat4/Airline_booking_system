import 'dart:convert';
import 'package:get/get.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

late List Flights = [];
Future numberOfTicketsInDatabase() async {
  late int i = 0;
  var url = Uri.parse("http://${ipv4}/number_of_tickets.php");
  var response = await http.get(url);
  json.decode(response.body);

  List list_of_acc = json.decode(response.body);
  while (list_of_acc.length > i) {
    var acc_obj = json.decode(response.body)[i];
    Flights.add(acc_obj[i]);
    i++;
  }
  return Flights;
}

class CartController extends GetxController {
  var _products = {}.obs;
  var ind;
  void addProduct(Product product) {
    ind = demoProducts.indexOf(product);

    if (_products.containsKey(product) && _products[product] < 10) {
      _products[product] += 1;
      Get.snackbar(
          "Product Added", "You have added ${product.title} ticket to the cart",
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
    } else if (_products.containsKey(product) && _products[product] == 10) {
      _products[product] = 10;
    } else {
      _products[product] = 1;
      Get.snackbar(
          "Product Added", "You have added ${product.title} ticket to the cart",
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
    }
  }

  void removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      Get.snackbar("Product Removed From Cart",
          "You have removed ${product.title} ticket From the cart",
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
      _products.removeWhere((key, value) => key == product);
    } else {
      Get.snackbar(
          "Product Removed", "You have removed ${product.title} ticket ",
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
      _products[product] -= 1;
    }
  }

  get products => _products;

  get productSubTotal {
    if (_products.entries.isNotEmpty) {
      return _products.entries
          .map((product) => product.key.price * product.value)
          .toList();
    } else
      return 0;
  }

  get total {
    if (_products.entries.isNotEmpty) {
      return _products.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    } else {
      return "0";
    }
  }

  get discountedtotal {
    if (_products.entries.isNotEmpty) {
      return _products.entries
          .map((product) =>
              product.key.price * product.value -
              (product.key.price * product.value * discount))
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    } else {
      return "0";
    }
  }

  get numberOfItemsInCart {
    if (_products.entries.isNotEmpty) {
      return _products.entries
          .map((product) => product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    } else {
      return "0";
    }
  }

  get numberOfItemsInCartHomeScreen {
    if (_products.entries.isNotEmpty) {
      return _products.entries
          .map((product) => product.value)
          .toList()
          .reduce((value, element) => value + element);
    } else {
      return 0;
    }
  }
}
