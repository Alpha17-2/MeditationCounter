import 'package:counter/models/user.dart' as model;
import 'package:counter/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  user.fullName,
                  style: GoogleFonts.lato(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  user.email,
                  style: GoogleFonts.lato(fontSize: 12),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset(
                      "lib/assets/images/yogafinal.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(begin: Alignment.bottomCenter, colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(0.2)
                    ]),
                    image: const DecorationImage(
                        image: AssetImage(
                            "lib/assets/images/BackgroundOfMeditate.jpg"),
                        opacity: 0.3,
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ));
  }
}
