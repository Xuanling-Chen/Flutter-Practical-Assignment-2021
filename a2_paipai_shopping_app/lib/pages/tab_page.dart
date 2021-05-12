import 'package:flutter/material.dart';
import './cart_page.dart';
import './products_grid.dart';
import './admin_page.dart';
import '../main.dart';

class MenuPage extends StatefulWidget {
  MenuPage();
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  _MenuPageState();
  int _selectedIndex = 0;

  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    ProductGrid(),
    CartView(),
    AdminPage(),
  ];

  void _onItemTapped(int index) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        ShopApp.isFilter = false;
        _selectedIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'admin',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}
