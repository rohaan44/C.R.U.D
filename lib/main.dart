import 'package:crud/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "C.R.U.D",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("C.R.U.D", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        body: Home(),
      ),
    );
  }
}
