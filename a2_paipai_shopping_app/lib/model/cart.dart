import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../model/product_model.dart';

// ignore: must_be_immutable
class CartItem extends Equatable {
  final Product product;
  int quantity;
  bool isSelected;
  CartItem(
      {@required this.product, this.quantity = 0, this.isSelected = false});

  @override
  List<Object> get props => [product, quantity, isSelected];

  Map<String, dynamic> toMap() {
    return {
      'title': product.title,
      'price': product.price,
      'quantity': quantity,
      'isSelected': isSelected,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  CartItem copyWith({
    Product product,
    int quantity,
    bool isSelected,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
