import 'package:dmin/Firebase/db.dart';
import 'package:dmin/Screens/Home/Home.dart';
import 'package:dmin/Screens/Login/login.dart';
import 'package:dmin/Screens/edit/edit.dart';

import 'package:dmin/controllers/controler.dart';
import 'package:dmin/wrapper.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Firebase/auth.dart';
import 'Screens/Add/add.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: controller(),
      ),
      ChangeNotifierProvider.value(value: Auth()),
    ],
    child: MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'myfont',
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Wrapper(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Home(),
        '/add': (context) => add(),
        '/edit': (context) => Editt(),
        '/login': (context) => login()
      },
    ),
  ));
}
