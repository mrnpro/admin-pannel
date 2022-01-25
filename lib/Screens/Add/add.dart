import 'dart:io';

import 'package:dmin/Constants.dart';
import 'package:dmin/components/btn.dart';

import 'package:dmin/components/cardbtn.dart';
import 'package:dmin/controllers/controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          children: [
            Consumer<controller>(
              builder: (context, controller, child) => controller.image == null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => {
                                //do smthing
                                controller.add_pic_camera()
                              },
                              child: const cardbtn(
                                txt: "Camera",
                                icon: Icons.camera,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: () => {
                                //do smthing
                                controller.add_pic_gal()
                              },
                              child: cardbtn(
                                txt: "Galary",
                                icon: Icons.photo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () => {
                        if (controller.isgalary)
                          {controller.add_pic_gal()}
                        else
                          {controller.add_pic_camera()}
                      },
                      child: Container(
                        height: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                              image: FileImage(File(controller.image!.path)),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
            ),
            Form(
                key: _theresult,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: kthirdcolor),
                        controller: Title,
                        keyboardType: TextInputType.text,
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      child: TextFormField(
                        style: const TextStyle(color: kthirdcolor),
                        controller: price,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          fillColor: kPrimaryColor,
                          filled: true,

                          hintText: " price ",
                          hintStyle: TextStyle(color: Colors.white),
                          // If  you are using latest version of flutter then lable text and hint text shown like this
                          // if you r using flutter less then 1.20.* then maybe this is not working properly
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter price';
                          }
                        },
                      ),
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
                    Consumer<controller>(
                      builder: (context, controller, child) => InkWell(
                        onTap: () async => {
                          if (_theresult.currentState!.validate())
                            {
                              EasyLoading.show(),
                              Future.delayed(Duration(seconds: 4), () {
                                EasyLoading.dismiss();
                                EasyLoading.showSuccess("success");
                                controller.post(
                                    Title.text, Description.text, price.text);
                              }),
                              Navigator.pop(context)

                              //do things
                            }
                        },
                        child: btn(btntxt: "post"),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
