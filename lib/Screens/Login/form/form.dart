import 'package:dmin/Screens/Login/componenet/btn.dart';
import 'package:flutter/material.dart';

class form extends StatelessWidget {
  form({Key? key}) : super(key: key);
  final _theresult = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController email = new TextEditingController();
    TextEditingController password = new TextEditingController();
    return Form(
        key: _theresult,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: TextFormField(),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Please enter email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') && !value.contains('.com'))
                    return "Enter Valid Email";
                  if (value.length < 10)
                    return "please enter valid Phone number";
                },
              ),
            ),
            InkWell(
              onTap: () async => {if (_theresult.currentState!.validate()) {}},
              child: btn(),
            ),
          ],
        ));
  }
}
