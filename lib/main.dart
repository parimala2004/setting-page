import 'package:flutter/material.dart';
import 'changepin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController confirmPinController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangePinPage(

      ),
    );
  }
}