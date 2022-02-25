import 'package:counter/models/user.dart' as model;
import 'package:counter/providers/userProvider.dart';
import 'package:counter/widgets/menuScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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

  bool _isAddButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          _isAddButtonPressed
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _countingPerDay = 0;
                    });
                  },
                  icon: const Icon(Icons.replay_outlined),
                  color: Colors.teal,
                  iconSize: 30,
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      _isAddButtonPressed = true;
                    });
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.teal,
                  iconSize: 30,
                ),
          const SizedBox(width: 10)
        ],
      ),
      drawer: ZoomDrawerWidget(),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 1),
              Text(
                "Meditation Counter",
                style: GoogleFonts.cagliostro(fontSize: 18),
              ),
              Text(
                "Welcome ${user.fullName}",
                style: GoogleFonts.cagliostro(
                    fontSize: 38, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(200),
                  onTap: () {
                    setState(() {
                      _countingPerDay++;
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
              const SizedBox(height: 30),
              Flexible(child: Container(), flex: 1)
            ],
          ),
        ),
      ),
    );
  }
}

//MenuDrawer
class ZoomDrawerWidget extends StatefulWidget {
  const ZoomDrawerWidget({Key? key}) : super(key: key);

  @override
  _ZoomDrawerWidgetState createState() => _ZoomDrawerWidgetState();
}

class _ZoomDrawerWidgetState extends State<ZoomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      backgroundColor: Colors.grey.shade200,
      style: DrawerStyle.Style1,
      menuScreen: const MenuScreen(),
      mainScreen: const CounterScreen(),
      angle: -12,
      duration: Duration(milliseconds: 200),
    );
  }
}
