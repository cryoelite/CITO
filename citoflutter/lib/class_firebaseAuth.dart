import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ClassFirebaseAuth {
  final String username;
  final String password;
  static final FirebaseAuth auth = FirebaseAuth.instance;

  ClassFirebaseAuth({@required this.username, @required this.password});

  Future<String> signIn() async {
    User userObject;
    FirebaseAuthException exception;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: username, password: password);
    } catch (ex, _) {
      exception = ex;
    }
    if (exception == null) {
      print("yoo");
    } else {
      print("bno");
    }
  }
}
