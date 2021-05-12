import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';
import '../cubit/product_cubit.dart';

class AdminPage extends StatelessWidget {
  static const int ADD_STOCK_COUNT = 10;
  static const String routeName = "/admin";
  @override
  Widget build(BuildContext context) {
    final favoriteProducts =
        context.watch<ProductCubit>().state.getFavoriteProduct();
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              TextButton(
                onPressed: () {
                  print('click reset all');
                  //update product state and cart state
                  context.read<ProductCubit>().resetStock();
                },
                child: ListTile(
                  title: Text('Reset All'),
                  subtitle: Text(
                      'Restore the inventory quantity to its initial value.'),
                ),
              ),
              dividerLine(),
              TextButton(
                onPressed: () {
                  //update product state and cart state
                  context
                      .read<ProductCubit>()
                      .addStockToEachProduct(ADD_STOCK_COUNT);
                },
                child: ListTile(
                  title: Text('Stock Day'),
                  subtitle: Text('Add 10 to the quantity of each product.'),
                ),
              ),
              dividerLine(),
              TextButton(
                onPressed: () {
                  context.read<ProductCubit>().deduceStockToHalf();
                },
                child: ListTile(
                  title: Text('Inventory disaster'),
                  subtitle:
                      Text('Decrease the quantity of all products by half.'),
                ),
              ),
              dividerLine(),
              SizedBox(
                height: 50,
              ),
              dividerLine(),
            ],
          ),
        ),
        Container(
          height: 200.0,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                child: Text(
                  'List of favorites',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                  textAlign: TextAlign.left,
                ),
                alignment: Alignment.topLeft,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                    thickness: 0,
                  ),
                  itemCount: favoriteProducts.length,
                  itemBuilder: (ctx, i) =>
                      FavoriteProductItem(favoriteProducts[i]),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

Widget dividerLine() {
  return Divider(
    height: 2,
    thickness: 1,
    indent: 10,
    endIndent: 10,
  );
}

class FavoriteProductItem extends StatelessWidget {
  final Product product;
  FavoriteProductItem(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          title: Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      product.imageUrl,
                      width: 100.0,
                      height: 100.0,
                      alignment: Alignment.center,
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
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
                          'Stock:' + product.stock.toString(),
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
                ),
              ],
            ),
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.redAccent,
              ),
              onPressed: () {
                context.read<ProductCubit>().toggleFavorite(product.id);
              })),
    );
  }
}
