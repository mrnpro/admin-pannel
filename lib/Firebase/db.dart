import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:image_picker/image_picker.dart';

class firebasedb {
  CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  Future<bool> add(
      String name, String description, String price, XFile? image) async {
    bool vallue = true;
    var imgname = products.doc().id;
    addimg(image, imgname);
    try {
      await products.add({
        'pname': name,
        'pdescription': description,
        'price': price + "birr",
        'imageurl': imgname
      }).then((value) => {vallue = false});
    } catch (e) {
      print(e);
    }

    return vallue;
  }

  addimg(XFile? image, String imgname) async {
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('productimages/$imgname')
          .putFile(File(image!.path))
          .then((p0) => print("you have uploaded the image too"));
    } catch (e) {
      print("you have error on upload " + e.toString());
    }
  }
}
