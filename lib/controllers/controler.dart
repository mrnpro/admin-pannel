import 'dart:io';

import 'package:dmin/Firebase/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

enum StateOfcamera { gallary, camera }

class controller extends ChangeNotifier {
  bool haveerror = true;
  final ImagePicker _picker = ImagePicker();
  bool isgalary = false;
  bool iscamera = false;

  List<XFile>? images;
  XFile? image;

  void add_pic_gal() async {
    remove();
    iscamera = false;
    image = await _picker.pickImage(source: ImageSource.gallery);
    isgalary = true;

    notifyListeners();
  }

  void add_pic_camera() async {
    remove();
    isgalary = false;
    image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      print("it is null");
    } else {
      print("the image is not null");
    }
    check();

    iscamera = true;
    notifyListeners();
  }

  check() {
    if (image == null) {
      print("it is null");
    } else {
      print("the image is not null");
    }
  }

  Future<bool> post(String name, String description, String price) async {
    return firebasedb().add(name, description, price, image) as bool;

    notifyListeners();
  }

  void remove() {
    notifyListeners();
  }
}
