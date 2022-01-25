import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> errors = [];

  signin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errors.add("The password provided is too weak.");
        print('The password provided is too weak.');
      } else {
        errors.add(e.code);
        print(e.code);
      }
    } catch (e) {
      errors.add(e.toString());
      print(e);
    }
  }

  signout() async {
    await auth.signOut();

    notifyListeners();
  }
}
