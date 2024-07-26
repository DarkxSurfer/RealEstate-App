import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wishlistapp/Screens/homeScreen.dart';
import 'package:wishlistapp/Screens/loginScreen.dart'; // Assuming this is used somewhere in your app

bool login = false;

Future<void> signUp(BuildContext context, String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              LoginScreen()), // Replace with your home screen widget
    );
    print('User registered successfully.');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    } else {
      print('Registration failed with error code: ${e.code}');
    }
  } catch (e) {
    print('Registration failed with error: $e');
  }
}

Future<void> signIn(BuildContext context, String email, String password) async {
  try {
    final UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    login = true;
    print('User signed in successfully: ${credential.user?.email}');
    print('Login status: $login');

    // Navigate to home screen if necessary
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomeScreen()), // Replace with your home screen widget
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print('Sign-in failed with error code: ${e.code}');
    }
  } catch (e) {
    print('Sign-in failed with error: $e');
  }
}
