import 'package:flutter/material.dart';

class Exercise6 extends StatelessWidget {
  static final title = 'Exercise 6';
  static final routeName = '/exercise6';

  const Exercise6({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> items = List<String>.generate(10, (i) => "$i");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _bodyStack(items),
    );
  }
}

Widget _bodyStack(List<String> items) => Stack(
      children: [
        Container(
          child: _buildTopBanner(),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 100.0),
          child: _buildListView(items),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: _buildBottomStack(),
        )
      ],
    );

Widget _buildTopBanner() => Stack(
      children: [
        Container(
          height: 80.0,
          color: Colors.lightGreen,
          alignment: Alignment.topCenter,
        ),
        Container(
          height: 40.0,
          width: 40.0,
          margin: EdgeInsets.only(left: 40.0, top: 20.0, bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
        ),
        Container(
          height: 40.0,
          width: 40.0,
          margin: EdgeInsets.only(left: 330.0, top: 20.0, bottom: 20.0),
          // margin: EdgeInsets.symmetric(horizontal: 200.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
        )
      ],
    );

Widget _buildListView(List<String> items) => ListView.builder(
      itemBuilder: (context, index) {
        return _buildCard('$index');
      },
    );

Widget _buildCard(String index) => SizedBox(
      height: 150,
      child: Card(
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 40,
                      ),
                    ),
                    Center(
                        child: Container(
                      margin: EdgeInsets.only(left: 35.0),
                      child: Text(
                        index,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
                  ],
                )),
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

Widget _buildBottomStack() => Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 80.0,
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
          margin: EdgeInsets.fromLTRB(80.0 * index, 20, 0, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.0),
            shape: BoxShape.rectangle,
            color: Colors.blue[100],
          ),
        );
      }),
    );
