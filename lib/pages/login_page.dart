import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    // setState(() {});
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "lib/assets/images/login.png",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "Welcome $name",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 30.0, bottom: 15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter the Username",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 111, 123, 117)),
                    labelText: "Username",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 111, 123, 117)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 111, 123, 117),
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "Username cannot be empty";
                    return null;
                  },
                ),
              ),
              const Divider(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter the Password",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 111, 123, 117),
                    ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 111, 123, 117),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 111, 123, 117),
                        ),
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password cannot be less than 6";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
