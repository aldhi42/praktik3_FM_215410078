import 'package:flutter/material.dart';
import 'home_page.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoT Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}