import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  // _CourseCodeListState createState() => _CourseCodeListState();
}

class _HomeState extends State<Home> {

  var list = List();
  var isLoading = false;
  // function to call data from database
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final res = await http.get("http://10.27.253.38:4000/discussions-data");
    if (res.statusCode == 200){
      print(res.body);
      list = json.decode(res.body);
      // print(list);
      setState(() {
        isLoading = false;
      });
    }
    else {
      throw Exception('Failed to load Course Codes');
    }
  }

  @override
  Widget build(BuildContext context) {

    _fetchData();
    var getCoursecode = list;
    String courseId;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: ListView.builder(
          itemCount: getCoursecode.length,
          itemBuilder: (context, index) {
          print(getCoursecode[index]);
            return Container(
              //color: Color.fromRGBO(r, g, b, opacity),
              padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forum');
                  courseId = getCoursecode[index]['name'];
                  _saveToState(courseId);
                },
                child: Text(getCoursecode[index]['name']),
              )
            );
          })
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     // Center(
        //     //   child: Container(
        //     //     color: Colors.pinkAccent,
        //     //     padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
        //     //     width: double.infinity,
        //     //     child: FlatButton(
        //     //       onPressed: () {
        //     //         Navigator.pushNamed(context, '/forum');
        //     //       },
        //     //       child: Text(
        //     //           'EE2003',
        //     //         style: TextStyle(
        //     //           fontSize: 28.0,
        //     //           fontWeight: FontWeight.bold
        //     //         ),
        //     //       ),
        //     //       ),
        //     //     ),
        //     // ),
        //     //SizedBox(height: 30.0),
        //     // Center(
        //     //   child: coursecode.map((coursecodes) => coursecodeTemplate(coursecodes)).toList(),
        //     // ),
        //
        //
        //
        //
        //
        //
        //   ],
        // ),
      ),
    );
  }

  _saveToState(String courseId) {
      String courseName = courseId;
  }


}
