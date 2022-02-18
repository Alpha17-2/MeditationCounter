import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:counter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 2),
                //Heading of the Text
                Text(
                  "Meditation\nCounter",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cagliostro(
                      fontSize: MediaQuery.of(context)
                          .textScaleFactor
                          .clamp(deviceWidth * 0.145, deviceWidth * 0.2),
                      fontWeight: FontWeight.bold),
                ),
                //Lottie Image
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset("lib/assets/images/Lotus.json",
                        height: deviceHeight * 0.43),
                    Lottie.asset("lib/assets/images/Yoga.json",
                        height: deviceHeight * 0.5),
                    //Let's Meditate, Let's Relax
                    Positioned.fill(
                      child: Align(
                        alignment: const Alignment(1.64, 1.35),
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.27,
                                height:
                                    MediaQuery.of(context).size.height * 0.14),
                            Text("Let's",
                                style: GoogleFonts.permanentMarker(
                                    textStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                        fontWeight: FontWeight.bold))),
                            SizedBox(
                                width: 17.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.14),
                            AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                RotateAnimatedText("Meditate!",
                                    textStyle: GoogleFonts.permanentMarker(
                                        textStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold))),
                                RotateAnimatedText("Relax!",
                                    textStyle: GoogleFonts.permanentMarker(
                                        textStyle: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            fontWeight: FontWeight.bold)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //Let's Start Button
                Flexible(child: Container(), flex: 3),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      _isElevated = !_isElevated;
                    });
                    await Future.delayed(const Duration(milliseconds: 600));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
                      child: Text("Let's Start",
                          style: GoogleFonts.cagliostro(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                )
              ],
            )),
      ),
    );
  }
}
