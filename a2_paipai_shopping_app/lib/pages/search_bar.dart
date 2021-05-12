import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../cubit/product_cubit.dart';
import '../pages/tab_page.dart';
import '../main.dart';
import '../model/product_model.dart';
import '../pages/product_item.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductCubit>().state.products;
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black45,
          ),
          onPressed: () {
            ShopApp.isFilter = true;
            showSearch(context: context, delegate: SearchProducts(products));
          }),
    );
  }
}

class SearchProducts extends SearchDelegate {
  final List<Product> allProducts;
  SearchProducts(this.allProducts);

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            ShopApp.isFilter = false;
            ShopApp.queryText = "";
            query = "";
            Navigator.pop(context);
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ShopApp.queryText = query;
    return MenuPage();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ShopApp.queryText = query;
    // return MenuPage();

    List<Product> suggestionList = [];
    query.isEmpty
        ? suggestionList = allProducts //In the true case
        : suggestionList.addAll(allProducts
            .where(
              // In the false case
              (element) => element.title.contains(query),
            )
            .toList());

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 3 / 2,
        // crossAxisSpacing: 10,
        // mainAxisSpacing: 10,
      ),
      itemCount: suggestionList.length,
      itemBuilder: (context, i) {
        return ProductItem(
            suggestionList[i].id,
            suggestionList[i].title,
            suggestionList[i].description,
            suggestionList[i].price,
            suggestionList[i].imageUrl,
            suggestionList[i].isFavorite,
            suggestionList[i].stock);

        /*ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );*/
      },
    );
  }
}
