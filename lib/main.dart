import 'package:dmin/Screens/Home/Home.dart';
import 'package:dmin/Screens/Login/login.dart';
import 'package:dmin/Screens/edit/edit.dart';
import 'package:dmin/controllers/controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Add/add.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: controller(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'myfont',
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Home(),
        '/add': (context) => add(),
        '/edit': (context) => Editt(),
      },
    ),
  ));
}
