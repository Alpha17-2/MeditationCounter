import 'package:counter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Text(
            "Meditation's \n Counter",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("lib/assets/images/tree.png",
                    fit: BoxFit.cover),
              ),
              AnimatedPositioned(
                
                duration: const Duration(seconds: 1),
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  // child: Image.asset("lib/assets/images/yoga.png"),
                  child: Image.asset("lib/assets/images/yogafinal.png"),
                  margin: const EdgeInsets.only(top: 145),
                ),
              ),
            ],
          ),
          Text(
            "A Perfect Time \nFor A Bit of Relax \nAnd Chanting Chill",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.loginRoute),
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
        ],
      )),
    );
  }
}
