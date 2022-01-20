import 'package:dmin/Screens/Home/Home.dart';
import 'package:dmin/Screens/Login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => login(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => const Home(),
    },
  ));
}
