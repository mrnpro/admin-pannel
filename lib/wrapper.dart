import 'package:dmin/Firebase/auth.dart';
import 'package:dmin/Screens/Home/Home.dart';
import 'package:dmin/Screens/Login/login.dart';

import 'package:flutter/cupertino.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Auth().auth.currentUser != null) ? const Home() : login();
  }
}
