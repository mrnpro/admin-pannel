import 'package:dmin/Constants.dart';
import 'package:dmin/Firebase/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mydialog extends StatelessWidget {
  const Mydialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
        builder: (context, controller, child) => Container(
                child: AlertDialog(
              backgroundColor: kPrimaryColor,
              title: const Center(
                child: Text(
                  'Error',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              content: Text("          ${controller.errors[0]}"),
              actions: <Widget>[
                TextButton(
                  onPressed: () =>
                      {controller.errors.clear(), Navigator.pop(context, 'OK')},
                  child: const Center(child: Text('Retry')),
                ),
              ],
            )));
  }
}
