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
            height: 50,
          ),
          Text(
            "Meditation's \n Counter",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 35,
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
              Positioned(
                // top: MediaQuery.of(context).size.width * 0.002,
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset("lib/assets/images/yoga.png"),
                  margin: const EdgeInsets.only(top: 104),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Let's Start",
              style: TextStyle(fontSize: 20,color: Colors.black),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
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
