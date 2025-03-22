import 'package:flutter/material.dart';
import 'package:ios_calculator/screen/calculator/calculator.dart';

class ButtonCalc extends StatelessWidget {
  final String text;
  final Color color;
  final double? width;
  final double? height;

  const ButtonCalc(this.text, this.color, {super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width / 4,
      height: height ?? (MediaQuery.of(context).size.height *0.6) / 5,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            // shape: const CircleBorder(),
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
