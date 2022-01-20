import 'package:dmin/Constants.dart';
import 'package:dmin/components/btn.dart';

import 'package:dmin/components/cardbtn.dart';
import 'package:flutter/material.dart';

class add extends StatelessWidget {
  add({Key? key}) : super(key: key);
  final _theresult = GlobalKey<FormState>();
  TextEditingController Title = new TextEditingController();
  TextEditingController Description = new TextEditingController();
  TextEditingController price = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Products"),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ksecondColor,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            InkWell(
              onTap: () => {
                //do smthing
              },
              child: const cardbtn(
                txt: "Addphoto",
                icon: Icons.photo,
              ),
            ),
            Form(
                key: _theresult,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      child: TextFormField(
                        style: const TextStyle(color: kthirdcolor),
                        controller: Title,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          fillColor: kPrimaryColor,
                          filled: true,

                          hintText: " Title ",
                          hintStyle: TextStyle(color: Colors.white),
                          // If  you are using latest version of flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Title';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      child: TextFormField(
                        autofocus: false,
                        style: const TextStyle(color: kthirdcolor),
                        maxLines: 7,
                        minLines: 6,
                        controller: Description,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          fillColor: kPrimaryColor,
                          filled: true,

                          hintText: "Description",
                          hintStyle: TextStyle(color: Colors.white),
                          // If  you are using latest version of flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Description';
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
                            //do things
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/second', (route) => false)
                          }
                      },
                      child: btn(btntxt: "post"),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
