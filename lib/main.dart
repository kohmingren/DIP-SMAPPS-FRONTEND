//import 'dart:js';

import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/forum.dart';
import 'pages/forum_answer.dart';

void main () => runApp(MaterialApp(
  routes: {
    '/': (context) => LoginScreen(),
    '/home': (context) => Home(),
    '/forum': (context) => Forum(),
    '/forum_answer': (context) => ForumAnswer(),
  },
));
