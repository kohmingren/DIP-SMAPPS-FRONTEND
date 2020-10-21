import 'package:flutter/material.dart';

class ForumAnswer extends StatefulWidget {
  @override
  _ForumAnswerState createState() => _ForumAnswerState();
}

class _ForumAnswerState extends State<ForumAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EE2003'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('How to do tut 3 que 1?'),
             SizedBox(height: 12.0),
             Container(
                child: Text('1+1=2'),
              ),
            ],
          ),
        ),
    );
  }
}
