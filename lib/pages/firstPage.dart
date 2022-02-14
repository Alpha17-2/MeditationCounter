import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: Text(
                "Meditation's Counter",
                style: GoogleFonts.permanentMarker(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.13,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Stack(
              children: [
                Lottie.asset(
                  "lib/assets/images/Meditations.json",
                  height: MediaQuery.of(context).size.height * 0.56,
                  fit: BoxFit.contain,
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(1.3, 1.35),
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width *0.30),
                        Text("Let's",
                            style: GoogleFonts.permanentMarker(
                                textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.07,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                            width: 20.0,
                            height: MediaQuery.of(context).size.height * 0.15),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText("Meditate!",
                                textStyle: GoogleFonts.permanentMarker(
                                    textStyle: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                        fontWeight: FontWeight.bold))),
                            RotateAnimatedText("Relax!",
                                textStyle: GoogleFonts.permanentMarker(
                                    textStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                  left: 40,
                  right: 40),
              child: GestureDetector(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text("Let's Start",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 25, 168, 150),
                        Color.fromRGBO(25, 168, 150, 0.6),
                        Color.fromRGBO(25, 168, 150, 0.1)
                      ]),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}