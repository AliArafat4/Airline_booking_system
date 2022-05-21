import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';

import '../constants.dart';
import 'package:http/http.dart' as http;

class Product {
  final String title, description, Time, Flight_date;
  final String Origin = "KSA";
  final List<String> images;
  final List<String> FlightClass;
  final double rating, price, Weight;
  final bool isFavourite, isPopular;
  final int Flight_number;
  final int Validity_period;
  final int Number_of_seats;

  Product({
    required this.Flight_date,
    required this.Time,
    required Origin,
    required this.Weight,
    required this.Validity_period,
    required this.Number_of_seats,
    required this.Flight_number,
    required this.images,
    required this.FlightClass,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
  /////////////
  // DISCARDED
  // Future TicketInfo() async {
  //   var url = Uri.parse("http://${ipv4}/flight.php");
  //   var response = await http.post(url, body: {
  //     //FIX
  //     "Time": Time,
  //     "Weight": Weight.toString(),
  //     "Flight_date": Flight_date,
  //     "Price": price.toString(),
  //     "Type": FlightClass,
  //     "Validity_period": Validity_period.toString(),
  //     "Flight_number": Flight_number.toString(),
  //     "Destination": title,
  //   });
  // }

  Future flights() async {
    var url = Uri.parse("http://${ipv4}/flight.php");
    var response = await http.post(url, body: {
      //FIX
      "Flight_number": Flight_number.toString(),
      "Origin": "KSA",
      "Destination": title,
      "Number_of_seats": Number_of_seats,
      "Flight_date": Flight_date,
      "Departure_Time": Time,
      "Arrival_time": Time,
      "Price": price.toString(),
      "Type": FlightClass.toString(),
      "Validity_period": Validity_period.toString(),
    });
  }
}

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

// List<Product> flightsInDatabase = [
//   Product(
//       images: [
//         "assets/images/Paris_1.png",
//         "assets/images/Paris_2.png",
//         "assets/images/Paris_3.png",
//         "assets/images/Paris_4.png",
//       ],
//       FlightClass: [
//         "First Class",
//         "Business  Class",
//         "Regular Class",
//       ],
//       Flight_date: Flight_date,
//       Time: Time,
//       Origin: Origin,
//       Weight: Weight,
//       Validity_period: Validity_period,
//       Number_of_seats: Number_of_seats,
//       Flight_number: Flight_number,
//       FlightClass: FlightClass,
//       title: title,
//       price: price,
//       description: description)
// ]
//////////////////////////

List<Product> demoProducts = [
  Product(
    images: [
      "assets/images/Paris_1.png",
      "assets/images/Paris_2.png",
      "assets/images/Paris_3.png",
      "assets/images/Paris_4.png",
    ],
    FlightClass: [
      "First Class",
      "Business  Class",
      "Regular Class",
    ],
    title: "France",
    price: 500,
    description: descriptionFrance,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    Time: "9:00 Am",
    Weight: 50.5,
    Validity_period: 90,
    Flight_number: 12,
    Flight_date: "11/1/2024",
    Origin: "KSA",
    Number_of_seats: 20,
  ),
  Product(
    images: [
      "assets/images/America_1.png",
      "assets/images/America_2.png",
      "assets/images/America_3.png",
    ],
    FlightClass: [
      "First Class",
      "Business  Class",
      "Regular Class",
    ],
    title: "USA",
    price: 650,
    description: descriptionAmerica,
    rating: 4.2,
    isFavourite: true,
    isPopular: true,
    Time: "9:00 Am",
    Weight: 50.5,
    Validity_period: 90,
    Flight_number: 12,
    Flight_date: "11/1/2024",
    Origin: "KSA",
    Number_of_seats: 20,
  ),
  Product(
    images: [
      "assets/images/Japan_1.png",
      "assets/images/Japan_2.png",
      "assets/images/Japan_3.png",
      "assets/images/Japan_4.png",
    ],
    FlightClass: [
      "First Class",
      "Business  Class",
      "Regular Class",
    ],
    title: "Japan",
    price: 450,
    description: descriptionJapan,
    rating: 4.7,
    isFavourite: true,
    isPopular: true,
    Time: "9:00 Am",
    Weight: 50.5,
    Validity_period: 90,
    Flight_number: 12,
    Flight_date: "11/1/2024",
    Origin: "KSA",
    Number_of_seats: 20,
  ),
  Product(
    images: [
      "assets/images/Italy_1.png",
      "assets/images/Italy_2.png",
      "assets/images/Italy_3.png",
      "assets/images/Italy_4.png",
    ],
    FlightClass: [
      "First Class",
      "Business  Class",
      "Regular Class",
    ],
    title: "Italy",
    price: 570,
    description: descriptionItaly,
    rating: 4.4,
    isFavourite: true,
    isPopular: true,
    Time: "9:00 Am",
    Weight: 50.5,
    Validity_period: 90,
    Flight_number: 12,
    Flight_date: "11/1/2024",
    Origin: "KSA",
    Number_of_seats: 20,
  ),
];
// final CartController controller = Get.find();
const String descriptionFrance = "";
const String descriptionAmerica = "";
const String descriptionJapan = "";
const String descriptionItaly = "";
