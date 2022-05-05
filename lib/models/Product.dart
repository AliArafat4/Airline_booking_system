import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<String> FlightClass;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.images,
    required this.FlightClass,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> demoProducts = [
  Product(
    images: [
      "assets/images/Paris_1.png",
      "assets/images/Paris_2.png",
      "assets/images/Paris_3.png",
    ],
    FlightClass: [
      "First Class",
      "Buessness Class",
      "Regular Class",
    ],
    title: "Paris",
    price: 500,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    FlightClass: [],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    images: [
      "assets/images/glap.png",
    ],
    FlightClass: [],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "assets/images/wireless headset.png",
    ],
    FlightClass: [],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
