import 'dart:math';

import 'package:counter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_widgets/animated_widgets.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 70.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          TranslationAnimatedWidget.tween(
            enabled: true,
            translationDisabled: const Offset(0, 200),
            translationEnabled: const Offset(0, 0),
            child: OpacityAnimatedWidget.tween(
              enabled: true,
              opacityDisabled: 0,
              opacityEnabled: 1,
              duration: const Duration(seconds: 3),
              child: Text(
                "Meditation's \n Counter",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          TranslationAnimatedWidget.tween(
            enabled: true,
            translationDisabled: const Offset(0, 200),
            translationEnabled: const Offset(0, 0),
            child: OpacityAnimatedWidget.tween(
              enabled: true,
              opacityDisabled: 0,
              opacityEnabled: 1,
              duration: const Duration(seconds: 3),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset("lib/assets/images/tree.png",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 230, left: 128),
                    alignment: Alignment.center,
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // color: Color.fromARGB(255, 27, 28, 30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(130, 237, 125, 58),
                            blurRadius: _animation.value,
                            spreadRadius: _animation.value,
                          )
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 40, right: 40, bottom: 15),
                    child: Image.asset("lib/assets/images/yogafinal.png"),
                    margin: const EdgeInsets.only(top: 145),
                  ),
                ],
              ),
            ),
          ),
          TranslationAnimatedWidget.tween(
            enabled: true,
            translationDisabled: const Offset(0, 200),
            translationEnabled: const Offset(0, 0),
            child: OpacityAnimatedWidget.tween(
              enabled: true,
              opacityDisabled: 0,
              opacityEnabled: 1,
              duration: const Duration(seconds: 3),
              child: Text(
                "A Perfect Time \nFor A Bit of Relax \nAnd Chanting Chill",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TranslationAnimatedWidget(
            enabled: true,
            values: const [Offset(0, 200), Offset(0, 250), Offset(0, 0)],
            duration: Duration(seconds: 4),
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, MyRoutes.loginRoute),
              child: const Text(
                "Let's Start",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 115, 128, 121)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
