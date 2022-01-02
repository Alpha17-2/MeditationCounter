import 'package:counter/utils/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {});
  }

  String name = "";
  String password = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Material(
      child: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
        Image.asset(
          "lib/assets/images/login.png",
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Text(
            "Welcome $name",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Don't have an account?",
              style: TextStyle(
                  color: Color.fromARGB(255, 111, 123, 117), fontSize: 18),
            ),
            Text(
              " SIGN UP",
              style: TextStyle(
                color: Color.fromARGB(255, 111, 123, 117),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 30.0, right: 30.0, top: 25.0, bottom: 15.0),
          key: _formKey,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Enter the Username",
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
            validator: (value) {
              if (value!.isEmpty) return "Username cannot be empty";
              return null;
            },
            onChanged: (value) {
              name = value;
              setState(() {});
            },
          ),
        ),
        const Divider(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
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
                return "Password cannot be less than 6 digits";
              }
              return null;
            },
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, MyRoutes.counterRoute),
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            child: Transform.scale(
              scale: _scale,
              child: _animatedButtonUI,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: RichText(
            text: TextSpan(
              text: "Forgot Password?",
              style: const TextStyle(
                color: Color.fromARGB(255, 111, 123, 117),
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ),
        ),
        const SizedBox(height: 100),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: SignInButton(
                    Buttons.AppleDark,
                    onPressed: () {},
                    text: ("Sign In"),
                    
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    text: ("Sign In"),
                  ),
                )),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: SignInButton(
                          Buttons.FacebookNew,
                          onPressed: () {},
                          text: "Sign In",
                        ))),
              ],
            ))
      ]))),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 50.0,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [BoxShadow(offset: Offset(0.0, 5.0))],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 93, 98, 98),
                  Color.fromARGB(255, 132, 151, 138)
                ])),
        child: const Center(
            child: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )),
      );
  void _onTapDown(TapDownDetails details) {
    _controller.forward();
    setState(() {});
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    setState(() {});
  }
}
