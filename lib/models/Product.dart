import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final int price;
  final bool isFavourite, isPopular;

  Product(
      {required this.images,
      this.isFavourite = false,
      this.isPopular = false,
      required this.title,
      required this.price,
      required this.description});
}

// demo products

List<Product> demoProducts = [
  Product(
      images: [
        'assets/images/pepsi.jpg',
        'assets/images/pepsi.jpg',
        'assets/images/family-pepsi.jpg'
      ],
      title: "قوطی پپسی ایرانی",
      price: 25000,
      isFavourite: true,
      description: "نوشابه قوطی پپسی ساخت ایران"),
  Product(
      images: [
        'assets/images/family-pepsi.jpg',
        'assets/images/family-pepsi.jpg'
      ],
      title: "نوشابه پپسی",
      price: 25000,
      description: "نوشابه  پپسی خانواده ، یک و نیم لیتری ساخت ایران"),
  Product(images: [
    'assets/images/dalil.jpg',
    'assets/images/dalil.jpg',
    'assets/images/dalil.jpg'
  ], title: "آبلیمو دلیل", price: 250000, description: "آبلیمو شیشه ای دلیل"),
  Product(
      images: ['assets/images/meshkot.jpg'],
      title: "لوبیا بلند مشکوه",
      price: 25000,
      description: "لوبیا بلند مشکوه"),
];
