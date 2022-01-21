import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class controller extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  bool isgalary = false;
  bool iscamera = false;

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
    iscamera = true;
    notifyListeners();
  }

  void remove() {
    image = null;
    notifyListeners();
  }
}
