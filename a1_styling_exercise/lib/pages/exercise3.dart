import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Exercise3 extends StatelessWidget {
  static final title = 'Exercise 3';
  static final routeName = '/exercise3';

  const Exercise3({Key key}) : super(key: key);

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
    return Center(child: _buildStack());
  }
}

Widget _buildStack() => Stack(
      children: List.generate(4, (index) {
        return Container(
          width: 100.0,
          margin: EdgeInsets.only(left: 80.0 * index),
          decoration: BoxDecoration(
            border: new Border.all(color: Colors.grey, width: 3),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
