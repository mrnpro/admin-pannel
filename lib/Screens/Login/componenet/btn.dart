import 'package:dmin/Constants.dart';
import 'package:flutter/material.dart';

class btn extends StatelessWidget {
  const btn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: kthirdcolor, borderRadius: BorderRadius.circular(2)),
      child: Center(
          child: Text(
        "Login",
        style: textheading1,
      )),
    );
  }
}
