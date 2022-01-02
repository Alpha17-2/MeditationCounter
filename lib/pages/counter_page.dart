import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Progress",
                style: GoogleFonts.lato(
                    fontSize: 50, fontWeight: FontWeight.bold)),
            Text(
              "1 Streak\nDaily Goal: 1000 Taps",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 20,
              ),
            ),
            Divider(),
            CircularPercentIndicator(
              percent: 0.5,
              radius: 380.0,
              lineWidth: 20.0,
              animation: true,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("1",
                      style: GoogleFonts.lato(
                          fontSize: 80, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Text("Tap!", style: GoogleFonts.lato(fontSize: 20)),
                ],
              ),
              
              progressColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
