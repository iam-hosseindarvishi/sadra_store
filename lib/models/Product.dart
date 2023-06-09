import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final String image;
  final int price;
  final bool isFavourite, isPopular;

  Product(
      {required this.image,
      this.isFavourite = false,
      this.isPopular = false,
      required this.title,
      required this.price,
      required this.description});
}

// demo products

List<Product> demoProducts = [
  Product(
      image: 'assets/images/pepsi.jpg',
      title: "قوطی پپسی ایرانی",
      price: 25000,
      isFavourite: true,
      description: "نوشابه قوطی پپسی ساخت ایران"),
  Product(
      image: 'assets/images/family-pepsi.jpg',
      title: "نوشابه پپسی",
      price: 25000,
      description: "نوشابه  پپسی خانواده ، یک و نیم لیتری ساخت ایران"),
  Product(
      image: 'assets/images/dalil.jpg',
      title: "آبلیمو دلیل",
      price: 250000,
      description: "آبلیمو شیشه ای دلیل"),
  Product(
      image: 'assets/images/meshkot.jpg',
      title: "لوبیا بلند مشکوه",
      price: 25000,
      description: "لوبیا بلند مشکوه"),
];
