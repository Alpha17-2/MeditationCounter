import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //SignUp the User
  Future<String> signUpUser({
    required String fullName,
    required String userName,
    required String email,
    required String password,
  }) async {
    String result = "Please enter all the fields";
    try {
      if (fullName.isNotEmpty &&
          userName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        //Register the user to FirebaseAuthentication
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //UserModel
        model.User user = model.User(
            fullName: fullName,
            userName: userName,
            email: email,
            password: password,
            uid: cred.user!.uid);

        //Add the user to Firestore Database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
        result = "Success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        result = "Enter a valid e-mail";
      } else if (error.code == "user-disabled") {
        result = "The email is already disabled";
      } else if (error.code == "user-not-found") {
        result = "User not found. Enter a valid e-mail";
      } else if (error.code == "wrong-password") {
        result = "Enter the correct password.";
      } else if (error.code == "email-already-in-use") {
        result = "Email already registered";
      } else {
        result = "Try Again";
      }
    } catch (error) {
      result = error.toString();
    }
    return result;
  }

  //Logging in user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String result = "Some error occurred";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "Successfully Logged-In";
      } else {
        result = "Please enter all the fields";
      }
    } catch (error) {
      return result = error.toString();
    }
    return result;
  }
}
