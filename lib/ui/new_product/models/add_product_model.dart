import 'package:flutter/material.dart';

class AddNewProductRequest {
  String title;
  num price;
  String description;
  String image;
  String category;
  AddNewProductRequest({
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.image,
    @required this.category,
  });
  toMap() {
    return {
      'title': this.title,
      'price': this.price,
      'description': this.description,
      'image': this.image,
      'category': this.category
    };
  }
}
