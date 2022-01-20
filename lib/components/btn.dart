import 'package:flutter/material.dart';

import 'package:dmin/Constants.dart';

class btn extends StatelessWidget {
  var btntxt = "null";
  btn({
    Key? key,
    required this.btntxt,
  }) : super(key: key);

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
        btntxt,
        style: textheading2,
      )),
    );
  }
}
