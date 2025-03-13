import 'package:flutter/material.dart';
import 'package:ios_calculator/screen/calculator/calculator.dart';

class ButtonCalc extends StatelessWidget {
  final String text;
  final Color color;

  const ButtonCalc(this.text, {this.color = const Color(0xff333333), super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      height: 95,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const CircleBorder(),
            // padding: const EdgeInsets.all(20),
          ),
          onPressed: () => handleButtonPress(text, context),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
