import 'package:counter/pages/login_page.dart';
import 'package:counter/utils/routes.dart';
import 'package:flutter/material.dart';
import './pages/front_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      routes: {
        "/": (context) => const FrontPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        
      },
    );
  }
}
