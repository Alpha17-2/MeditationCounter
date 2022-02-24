import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CounterScreenUsingFirebaseAuth extends StatefulWidget {
  const CounterScreenUsingFirebaseAuth({Key? key}) : super(key: key);

  @override
  State<CounterScreenUsingFirebaseAuth> createState() =>
      _CounterScreenUsingFirebaseAuthState();
}

class _CounterScreenUsingFirebaseAuthState
    extends State<CounterScreenUsingFirebaseAuth> {
  String fullName = "";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    print(snap.data());

    setState(() {
      fullName = (snap.data() as Map<String, dynamic>)[
          "fullName"]; //the snap.data() is an object that is we're using map over here as the map is an object
    });
    print(fullName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $fullName"),
      ),
    );
  }
}
