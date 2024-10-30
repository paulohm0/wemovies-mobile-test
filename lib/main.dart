import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wemovies_mobile_test/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Movies',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/homescreen',
      routes: {
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
