import 'package:counter/pages/PageThree.dart';
import 'package:counter/pages/pageFour.dart';
import 'package:counter/resources/authMethods.dart';
import 'package:counter/utils/utils.dart';
import 'package:counter/widgets/textFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: Container(
          height: deviceHeight,
          width: deviceWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: deviceHeight * 0.09),
                  child: Lottie.asset(
                      //Lottie Animation
                      "lib/assets/images/signIn.json"),
                ),
                //SizedBox
                const Opacity(opacity: 0.0, child: Divider()),
                //Welcome Message
                Text("Welcome",
                    style: GoogleFonts.cagliostro(
                        fontSize: MediaQuery.of(context)
                            .textScaleFactor
                            .clamp(deviceWidth * 0.101, deviceWidth * 0.2),
                        fontWeight: FontWeight.w600)),
                //SizedBox
                const Opacity(opacity: 0.0, child: Divider()),
                //InputFormField for email
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: "Enter your Username",
                    labelText: "Username",
                    textInputType: TextInputType.emailAddress),
                //SizedBox
                const SizedBox(
                  height: 20,
                ),
                //InputFormfield for password
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Enter your Password",
                  labelText: "Password",
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                //FlexibleWidget
                const Opacity(opacity: 0.0, child: Divider()),
                //Login Button
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      _isLoading = true;
                      _isElevated = !_isElevated;
                    });
                    await Future.delayed(const Duration(milliseconds: 400));
                    String result = await AuthMethods().loginUser(
                        email: _emailController.text,
                        password: _passwordController.text);
                    if (result == "Successfully Logged-In") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CounterScreen()));
                    } else {
                      showSnackBar(result, context);
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: _isLoading
                      ? SizedBox(
                          height: 52,
                          child: Lottie.asset("lib/assets/images/Loading.json"))
                      : AnimatedContainer(
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
                            child: Text("Login",
                                style: GoogleFonts.cagliostro(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                ),
                //Flexible Widget
                const Opacity(opacity: 0.0, child: Divider()),
                //Transtioning for signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text("Don't you have an account?"),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Container(
                        child: const Text(
                          " Sign Up.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        )));
  }
}
