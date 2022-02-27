import 'package:flutter/material.dart';
import 'package:flutter_workshop_by_newii/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.kanit().fontFamily,
        scaffoldBackgroundColor: Colors.lightBlue[900],
      ),
      home: LoginScreen(),
    );
  }
}
