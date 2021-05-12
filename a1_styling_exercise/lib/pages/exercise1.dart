import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Exercise1 extends StatelessWidget {
  static final title = 'Exercise 1';
  static final routeName = '/exercise1';

  const Exercise1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.green,
        ),
      ),
      Expanded(
        child: Container(color: Colors.yellow),
      ),
      Expanded(
        child: Container(color: Colors.red),
      )
    ]);
  }
}
