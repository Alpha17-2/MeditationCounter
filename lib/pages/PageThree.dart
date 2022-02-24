import 'package:counter/pages/pageOne.dart';
import 'package:counter/pages/pageTwo.dart';
import 'package:counter/resources/authMethods.dart';
import 'package:counter/utils/utils.dart';
import 'package:counter/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      body: Container(
        decoration: BoxDecoration(
            //BackgroundImage Added
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
                image: const AssetImage("lib/assets/images/Plants.jpg"),
                fit: BoxFit.cover)),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox
              const SizedBox(height: 15),
              //SignUp
              const Center(
                  child: Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              )),
              //SizedBox
              const SizedBox(height: 4),
              //FlexibleWidget
              Flexible(child: Container(), flex: 2),
              //InputFormField for Name
              TextFieldInput(
                  textEditingController: _nameController,
                  hintText: "Cristiano Ronaldo",
                  labelText: "Full Name",
                  textInputType: TextInputType.text),
              //SizedBox
              const SizedBox(height: 20),
              //InputFormField for email
              TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: "Cristiano_Ronaldo",
                  labelText: "Username",
                  textInputType: TextInputType.text),
              //SizedBox
              const SizedBox(height: 20),
              //TextFormField for email
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "cristianoronaldo@gmail.com",
                labelText: "Email",
                textInputType: TextInputType.emailAddress,
              ),
              //SizedBox
              const SizedBox(height: 19),
              //InputFormfield for password
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "**********",
                labelText: "Password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              //SizedBox
              const SizedBox(height: 20),
              //FlexibleWidget
              Flexible(child: Container(), flex: 2),
              //Login Button
              Center(
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      _isLoading = true;
                      _isElevated = !_isElevated;
                    });
                    String result = await AuthMethods().signUpUser(
                        fullName: _nameController.text,
                        userName: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text);
                    print(result);
                    await Future.delayed(const Duration(milliseconds: 400));
                    if (result != "Success") {
                      showSnackBar(result, context);
                    } else if (result == "Success") {
                      result == "User registered successfully";
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PageTwo()));
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50,
                    width: deviceWidth * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _isElevated
                            ? [
                                BoxShadow(
                                    color: Colors.teal.shade800,
                                    offset: const Offset(4, 4),
                                    blurRadius: 15,
                                    spreadRadius: 1),
                                const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-4, -4),
                                    blurRadius: 15,
                                    spreadRadius: 1)
                              ]
                            : null),
                    child: Center(
                      child: Text("Sign Up",
                          style: GoogleFonts.cagliostro(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              //SizedBox
              const SizedBox(height: 17),
              //Back Button
              Center(
                child: _isLoading
                    ? Container(
                        height: 48,
                        child: Lottie.asset("lib/assets/images/Loading.json"),
                      )
                    : TextButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageTwo(),
                            )),
                        child: Text(
                          'Back',
                          style: TextStyle(
                            fontSize: deviceWidth * 0.045,
                            color: Colors.black54,
                          ),
                        )),
              ),
              //Flexible Widget
              Flexible(
                child: Container(),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
