import 'package:flutter/material.dart';
import 'package:ios_calculator/screen/calculator/calculator.dart';

class WidebuttonCalc extends StatelessWidget {
  final String text;
  final Color color;

  const WidebuttonCalc(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: (screenHeight *0.6 / 5) * 2,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const StadiumBorder(),
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
