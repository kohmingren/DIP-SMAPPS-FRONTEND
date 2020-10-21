import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
  home: LoginScreen(),
));

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var isLogged = true;
  var isLoading = false;

  // function to login
  _loginClick(username, password) async {
    setState(() {
      isLoading = true;
    });
    final res = await http.post("http://10.27.253.38:4000/user/login",
        body:{
          "username":'test',
          "password":'123123'
        });
    print(res.statusCode);
    print(res.body);
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {

    var usernameInput = "";
    var passwordInput = "";

    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_login.jpg'),
                fit:BoxFit.cover,
              )
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'UserName:',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      style: TextStyle(
                        height: 0.5,
                      ),
                      onChanged: (text) {
                          usernameInput = text;
                          // print(usernameInput);
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200]
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Password:',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      obscureText : _obscureText,
                      onChanged: (text) {
                          passwordInput = text;
                          // print(passwordInput);
                      },
                      style: TextStyle(
                        height: 0.5,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            }),
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        onPressed: () async {
                          // print(usernameInput);
                          // print(passwordInput);
                          // _loginClick(usernameInput, passwordInput);
                          var body = {
                            "username":"testUser",
                            "password":"testpass"
                          };
                          print(body);
                          final res = await http.post("http://10.27.253.38:4000/user/login",
                          body:body);
                          print(res.statusCode);
                          print(res.body);
                          // if(isLogged) {
                          //   Navigator.pushNamed(context, '/home');
                          // }
                          // else{
                          //   return showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return AlertDialog(
                          //         content: Text("Login Failed"),
                          //       );
                          //     },
                          //   );
                          // }
                        },
                        child: Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 20,
                            )
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    )
                  ]
              )
          ),
        )
    );
  }
}
