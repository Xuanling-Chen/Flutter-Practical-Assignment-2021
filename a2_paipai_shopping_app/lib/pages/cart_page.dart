import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/product_cubit.dart';
import '../model/product_model.dart';
import '../model/cart.dart';

class CartView extends StatelessWidget {
  static const String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state.cartItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black45),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              color: Colors.orangeAccent,
              icon: Icon(Icons.delete_outline),
              onPressed: () {
                print(cartItems.first.isSelected);
                context.read<CartCubit>().checkoutSelectItems();
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              itemCount: cartItems.length,
              itemBuilder: (ctx, i) => CartViewItem(cartItems[i].product,
                  cartItems[i].quantity, cartItems[i].isSelected),
            ),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("       Checkout        "),
                onPressed: () {
                  context.read<CartCubit>().checkoutSelectItems();
                  context.read<ProductCubit>().deduceCartStock(cartItems);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class CartViewItem extends StatelessWidget {
  final Product product;
  final int quantity;
  final bool isSelected;
  CartViewItem(this.product, this.quantity, this.isSelected);

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state.cartItems;
    final products = context.watch<ProductCubit>().state.products;
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            context.read<CartCubit>().toggleSelectItem(product.id);
          },
          icon: Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank),
          tooltip: 'checkbox',
        ),
        Container(
          width: 300,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.imageUrl,
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      product.title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(bottom: 4),
                  ),
                  Container(
                    child: Text(
                      'Stock:' +
                          products.elementAt(product.id).stock.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(bottom: 4),
                  ),
                  Text(
                    product.price.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                color: Colors.grey[200],
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      context.read<CartCubit>().addItem(CartItem(
                          product: product,
                          quantity: quantity,
                          isSelected: isSelected));
                    }),
              ),
            ),
            Text(quantity.toString()),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 40,
                height: 40,
                color: Colors.grey[200],
                child: IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      context.read<CartCubit>().removeItem(product.id);
                    }),
              ),
            )
          ],
        )
      ],
    );
  }
}
