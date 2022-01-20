import 'package:flutter/material.dart';

import '../../../Constants.dart';

class urlogohere extends StatelessWidget {
  const urlogohere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        "Your logo here",
        style: textheading2,
      ),
      backgroundColor: kthirdcolor,
      radius: 100,
    );
  }
}
