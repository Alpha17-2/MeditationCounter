import 'package:animated_widgets/generated/i18n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String fullName;
  final String userName;
  final String email;
  final String password;
  final String uid;
  const User(
      {required this.fullName,
      required this.userName,
      required this.email,
      required this.password,
      required this.uid});

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "userName": userName,
        "email": email,
        "password": password,
        "uid": uid
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        fullName: snapshot['fullName'],
        userName: snapshot['userName'],
        email: snapshot['email'],
        password: snapshot['password'],
        uid: snapshot['uid']);
  }
}
