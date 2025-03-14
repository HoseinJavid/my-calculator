import 'package:flutter/material.dart';
import 'package:ios_calculator/screen/calculator/calculator.dart';

class WidebuttonCalc extends StatelessWidget {
  final String text;
  final Color color;

  const WidebuttonCalc(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: 95,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const StadiumBorder(),
          ),
          onPressed: () => handleButtonPress(text, context),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
