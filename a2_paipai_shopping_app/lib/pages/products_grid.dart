import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../cubit/product_cubit.dart';
import '../main.dart';
import './search_bar.dart';

class ProductGrid extends StatelessWidget {
  static const String routeName = '/overview';
  ProductGrid();

  @override
  Widget build(BuildContext context) {
    final products = ShopApp.isFilter
        ? context
            .watch<ProductCubit>()
            .state
            .products
            .where((element) => element.title.contains(ShopApp.queryText))
            .toList()
        : context.watch<ProductCubit>().state.products;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Pai Pai',
            style: TextStyle(color: Colors.black45),
          ),
          centerTitle: true,
          actions: [SearchBar()],
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatssio: 1.8 / 2,
              // crossAxisSpacing: 5,
              // mainAxisSpacing: 5,
            ),
            itemCount: products.length,
            itemBuilder: (context, i) => ProductItem(
                products[i].id,
                products[i].title,
                products[i].description,
                products[i].price,
                products[i].imageUrl,
                products[i].isFavorite,
                products[i].stock)));
  }
}
