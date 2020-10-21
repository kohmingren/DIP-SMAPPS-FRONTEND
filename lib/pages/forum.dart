import 'package:flutter/material.dart';
import 'home.dart';

class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EE2003',
      home: ForumPage(),
    );
  }
}

class ForumPage extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<ForumPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('EE2003'),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: TextField(
      controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(myController.text),

                );
              },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

//
// class Forum extends StatefulWidget {
//   @override
//   _ForumState createState() => _ForumState();
// }
//
// class _ForumState extends State<Forum> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EE2003'),
//         centerTitle: true,
//         backgroundColor: Colors.pinkAccent,
//       ),
//         body: Padding(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(30.0),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.pinkAccent)
//               ),
//                 child: FlatButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/forum_answer');
//                 },
//                 child: Text(
//                   'How to do tut 3 question 1?'
//                 ),
//               )
//             ),
//             SizedBox(height: 12.0),
//             // Container(
//             //   padding: EdgeInsets.all(30.0),
//             //   decoration: BoxDecoration(
//             //     border:Border.all(color: Colors.pinkAccent)
//             //   ),
//             //   width: double.infinity,
//             //   child: Text(
//             //       '1+1=2',
//             //     style: TextStyle(
//             //       fontSize: 20,
//             //     ),
//             //   ),
//             //
//             // ),
//           ],
//         ),
//       )
//
//     );
//   }
// }
