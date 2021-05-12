import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercise4 extends StatelessWidget {
  static final title = 'Exercise 4';
  static final routeName = '/exercise4';

  const Exercise4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: _buildCard()),
    );
  }
}

Widget _buildCard() => SizedBox(
      height: 210,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 50,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 40.0,
                  margin: EdgeInsets.only(left: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 200.0,
                  height: 40.0,
                  margin: EdgeInsets.only(left: 40.0),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
