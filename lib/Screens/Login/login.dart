import 'package:dmin/Constants.dart';
import 'package:dmin/Firebase/auth.dart';
import 'package:dmin/components/alert_dialog.dart';

import 'package:dmin/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../components/btn.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);
  final _theresult = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: ksecondColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Auth>(
                    builder: (context, controller, child) => Container(
                          padding: const EdgeInsets.only(
                            top: 30,
                          ),
                          height: 400,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Form(
                              key: _theresult,
                              child: Column(
                                children: [
                                  const Text("Login Please",
                                      style: textheading1),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: kthirdcolor),
                                      controller: email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        fillColor: ksecondColor,
                                        filled: true,

                                        hintText: "Enter Your Email Adress",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
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
                                          return "Enter Valid Email  it should contain @example.com";
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    child: TextFormField(
                                      obscureText: true,
                                      autofocus: false,
                                      style:
                                          const TextStyle(color: kthirdcolor),
                                      controller: password,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: const InputDecoration(
                                        fillColor: ksecondColor,
                                        filled: true,

                                        hintText: "Enter your password",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        // If  you are using latest version of flutter then lable text and hint text shown like this
                                        // if you r using flutter less then 1.20.* then maybe this is not working properly
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your password';
                                        }

                                        if (value.length < 8) {
                                          return "please enter secured password";
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  InkWell(
                                    onTap: () async => {
                                      if (_theresult.currentState!.validate())
                                        {
                                          EasyLoading.show(),
                                          await controller.signin(
                                              email.text, password.text),
                                          if (controller.auth.currentUser !=
                                              null)
                                            {
                                              EasyLoading.dismiss(),
                                              EasyLoading.showSuccess(
                                                  "Welcome Admin"),
                                              controller.errors.clear(),
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/second',
                                                      (route) => false)
                                            }
                                          else
                                            {
                                              EasyLoading.dismiss(),
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) =>
                                                          Mydialog())
                                            }
                                        }
                                    },
                                    child: btn(
                                      btntxt: "Login",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  kforgetpass
                                ],
                              )),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
