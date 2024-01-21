// /lib/auth.dart

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw FirebaseAuthException(message: e.toString());
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw FirebaseAuthException(message: e.toString());
    }
  }

  // Add other authentication methods as needed

  // Example: Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Example: Get the current user
  User? get currentUser => _auth.currentUser;
}

class FirebaseAuthException implements Exception {
  final String message;

  FirebaseAuthException({required this.message});
}

