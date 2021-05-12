import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercise5 extends StatelessWidget {
  static final title = 'Exercise 5';
  static final routeName = '/exercise5';

  const Exercise5({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _bodyStack(),
    );
  }

  Widget _bodyStack() => Stack(
        children: [
          Container(
            child: _topStack(),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 100.0),
            child: _buildMidBox(),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: _buildBottomStack(),
          )
        ],
      );

  Widget _topStack() => Stack(
        alignment: Alignment.topCenter,
        children: [
          Expanded(
            child: Container(
              height: 100.0,
              color: Colors.green,
            ),
          ),
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.purple,
          ),
        ],
      );
}

Widget _buildMidBox() => SizedBox(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue[200],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.purple[400],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue[200],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 300.0),
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget _buildBottomStack() => Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 100.0,
          color: Colors.pinkAccent,
        ),
        Container(
          margin: EdgeInsets.only(left: 70.0),
          child: _generateRectangle(),
        ),
      ],
    );

Widget _generateRectangle() => Stack(
      children: List.generate(4, (index) {
        return Container(
          width: 40.0,
          height: 40.0,
          margin: EdgeInsets.fromLTRB(80.0 * index, 25, 0, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
        );
      }),
    );
