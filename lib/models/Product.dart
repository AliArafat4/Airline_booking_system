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
      "assets/images/Paris_4.png",
    ],
    FlightClass: [
      "First Class",
      "Buessness Class",
      "Regular Class",
    ],
    title: "France",
    price: 500,
    description: descriptionFrance,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    images: [
      "assets/images/America_1.png",
      "assets/images/America_2.png",
      "assets/images/America_3.png",
    ],
    FlightClass: [
      "First Class",
      "Buessness Class",
      "Regular Class",
    ],
    title: "USA",
    price: 650,
    description: descriptionAmerica,
    rating: 4.2,
    isFavourite: true,
    isPopular: true,
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
      "Buessness Class",
      "Regular Class",
    ],
    title: "Japan",
    price: 450,
    description: descriptionJapan,
    rating: 4.7,
    isFavourite: true,
    isPopular: true,
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
      "Buessness Class",
      "Regular Class",
    ],
    title: "Italy",
    price: 570,
    description: descriptionItaly,
    rating: 4.4,
    isFavourite: true,
    isPopular: true,
  ),
];

const String descriptionFrance = "";
const String descriptionAmerica = "";
const String descriptionJapan = "";
const String descriptionItaly = "";
