import 'package:flutter/material.dart';
import 'pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CalculateGPA(),
      },
    );
  }
}
