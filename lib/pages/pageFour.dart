import 'package:counter/models/user.dart' as model;
import 'package:counter/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

//Using Provider State Management
class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  int _target = 100;
  int _countingPerDay = 0;
  int _countinPerWeek = 0;
  int _countingPerYear = 0;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          "Welcome ${user.fullName}",
          style: const TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _countingPerDay = 0;
              });
            },
            icon: const Icon(Icons.replay_outlined),
            color: Colors.teal,
            iconSize: 25,
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flexible(child: Container(), flex: 1),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(200),
                  onTap: () {
                    setState(() {
                      _countingPerDay++;
                      _countinPerWeek++;
                      _countingPerYear++;
                    });
                  },
                  child: CircularPercentIndicator(
                      animateFromLastPercent: true,
                      animationDuration: 500,
                      radius: deviceWidth * 0.42,
                      lineWidth: 20,
                      progressColor: Colors.teal,
                      percent: _countingPerDay / _target,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "Tap here!\n$_countingPerDay",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.cagliostro(fontSize: 35),
                      )),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
