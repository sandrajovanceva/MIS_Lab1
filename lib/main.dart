import 'package:flutter/material.dart';
import 'package:mis_lab/screens/DetailsPage.dart';
import 'package:mis_lab/screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 223111',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade100),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(title: 'Распоред за испити - 223111'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}
