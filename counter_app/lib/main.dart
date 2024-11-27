import 'package:flutter/material.dart';

import 'home_scern.dart';

void main() {
  runApp(const CounterApp());
}
class CounterApp extends StatelessWidget{
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScern(),
    );
  }
}
