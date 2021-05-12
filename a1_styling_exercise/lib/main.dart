import 'package:flutter/material.dart';
import './routes.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Assignment 1',
    initialRoute: '/',
    routes: Routes.routes,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment 1',
      initialRoute: '/',
      routes: Routes.routes,
    );
  }
}
