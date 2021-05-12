import 'package:flutter/material.dart';

class Exercise2 extends StatelessWidget {
  static final title = 'Exercise 2';
  static final routeName = '/exercise2';

  const Exercise2({Key key}) : super(key: key);

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
        flex: 1,
      ),
      Expanded(
        child: Container(color: Colors.yellow),
        flex: 2,
      ),
      Expanded(
        child: Container(color: Colors.red),
        flex: 1,
      ),
    ]);
  }
}
