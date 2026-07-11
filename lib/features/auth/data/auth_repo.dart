import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  // Firebase Auth Instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUp(
    String email,
    String password,
  ) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  Future<UserCredential> signIn(
  String email,
  String password,
) async {
  return await _firebaseAuth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}

Future<void> signOut() async {
  await _firebaseAuth.signOut();
}
}

//0 connect your app with firebase project
// 0.1 await Firebase.initializeApp(
 // 1- enable firebase [service] in your firebase project
 // 2- add firebase_core and [service package] dependencies in pubspec.yaml
 // 3- make a class of this service and implement the methods of this service in this class