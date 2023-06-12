import 'package:flutter/material.dart';
import 'package:simple_cart_bloc/features/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Simple Cart Flutter Bloc',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
