import 'package:counter/pages/firstPage.dart';
import 'package:counter/pages/login_page.dart';
import 'package:counter/pages/pageFour.dart';
import 'package:counter/pages/pageFourUsingFirebaseAuth.dart';
import 'package:counter/pages/pageOne.dart';
import 'package:counter/pages/pageTwo.dart';
import 'package:counter/providers/userProvider.dart';
import 'package:counter/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const CounterScreen();
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Lottie.asset("lib/assets/images/Loading.json"),
              );
            }
            return const PageTwo();
          },
        ),
      ),
    );
  }
}
