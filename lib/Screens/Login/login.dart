import 'package:dmin/Constants.dart';
import 'package:dmin/Screens/Login/form/form.dart';
import 'package:flutter/material.dart';

import 'componenet/btn.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  final _theresult = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ksecondColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                height: 400,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Form(
                    key: _theresult,
                    child: Column(
                      children: [
                        Text("Login Please", style: textheading1),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          child: TextFormField(
                            style: TextStyle(color: kthirdcolor),
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: ksecondColor,
                              filled: true,

                              hintText: "Enter Your Email Adress",
                              hintStyle: TextStyle(color: Colors.white),
                              // If  you are using latest version of flutter then lable text and hint text shown like this
                              // if you r using flutter less then 1.20.* then maybe this is not working properly
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@') &&
                                  !value.contains('.com'))
                                return "Enter Valid Email  it should contain @";
                            },
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            style: TextStyle(color: kthirdcolor),
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              fillColor: ksecondColor,
                              filled: true,

                              hintText: "Enter your password",
                              hintStyle: TextStyle(color: Colors.white),
                              // If  you are using latest version of flutter then lable text and hint text shown like this
                              // if you r using flutter less then 1.20.* then maybe this is not working properly
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }

                              if (value.length < 8)
                                return "please enter secured password";
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () async => {
                            if (_theresult.currentState!.validate())
                              {Navigator.pushNamed(context, '/second')}
                          },
                          child: btn(),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
