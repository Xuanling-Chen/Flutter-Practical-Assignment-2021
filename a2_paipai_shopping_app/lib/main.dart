import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './cubit/product_cubit.dart';
import './cubit/cart_cubit.dart';
import './pages/products_grid.dart';
import './pages/cart_page.dart';
import './pages/tab_page.dart';
import './pages/admin_page.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  // This widget is the root of your application.
  static bool isFilter = false;
  static String queryText = "";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (_) => CartCubit()..init(),
        ),
        BlocProvider<ProductCubit>(
          create: (_) => ProductCubit()..init(),
        ),
      ],
      child: MaterialApp(
        home: Builder(
          builder: (context) => MenuPage(),
        ),
        routes: {
          ProductGrid.routeName: (context) => ProductGrid(),
          CartView.routeName: (context) => CartView(),
          AdminPage.routeName: (context) => AdminPage(),
        },
      ),
    );
  }
}
