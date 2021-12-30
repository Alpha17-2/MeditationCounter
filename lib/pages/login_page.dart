import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "";
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "lib/assets/images/login.png",
              fit: BoxFit.fill,
            ),
            Text(
              "Welcome $name",
              style:
                  GoogleFonts.lato(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration:  InputDecoration(
                  hintText: "Enter the Name",
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 111, 123, 117)),
                  labelText: "Username",
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 111, 123, 117)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 111, 123, 117),
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
