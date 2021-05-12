import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/product_cubit.dart';
import '../model/cart.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final int stock;

  ProductItem(this.id, this.title, this.description, this.price, this.imageUrl,
      this.isFavorite, this.stock);

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductCubit>().state.products;
    return SizedBox(
      width: 210,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  color: Colors.grey[300],
                  child: Image.asset(
                    imageUrl,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          '$title',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                '￥$price',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              Text(
                                  '|stock:' +
                                      products.elementAt(id).stock.toString(),
                                  style: TextStyle(color: Colors.black45)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //cart item add one record, and the stock reduce one quantity
                      context.read<CartCubit>().addItem(CartItem(
                          product: products.elementAt(id),
                          quantity: 1,
                          isSelected: true));
                      // context.read<ProductCubit>().deduceStock(id);
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 40,
                height: 40,
                color: Colors.white70,
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    context.read<ProductCubit>().toggleFavorite(id);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

    ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: Stack(
        children: <Widget>[
          GridTile(
            child: Container(
              padding: EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: 16 / 15,
                child: Image.asset(
                  imageUrl,
                  width: 10,
                  height: 10,
                ),
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.white,
              title: Column(
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        '￥$price',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      Flexible(
                        child: Text(
                            '|stock' + products.elementAt(id).stock.toString(),
                            style: TextStyle(color: Colors.black45)),
                      ),
                    ],
                  )
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  //cart item add one record, and the stock reduce one quantity
                  context.read<CartCubit>().addItem(CartItem(
                      product: products.elementAt(id),
                      quantity: 1,
                      isSelected: true));
                  // context.read<ProductCubit>().deduceStock(id);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 40,
                height: 40,
                color: Colors.grey[200],
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline_outlined,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    context.read<ProductCubit>().toggleFavorite(id);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
