import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  int stock;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false,
      this.stock});

  Product copyWith(
      {int id,
      String title,
      String description,
      double price,
      String imageUrl,
      bool isFavorite,
      int stock}) {
    return Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        isFavorite: isFavorite ?? this.isFavorite,
        stock: stock ?? this.stock);
  }

  @override
  List<Object> get props =>
      [id, title, description, price, imageUrl, isFavorite, stock];

  @override
  String toString() =>
      '{ $id, $title, $description,$price,$imageUrl,$isFavorite,$stock }';

  @override
  bool get stringify => true;
}
