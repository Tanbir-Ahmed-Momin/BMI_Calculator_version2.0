import 'package:bmiadhoc/Screen/homescreen.dart';
import 'package:flutter/material.dart';

 void main() {
  runApp(Bmi());
}
class Bmi extends StatelessWidget {
  const Bmi({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}