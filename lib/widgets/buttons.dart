import 'package:flutter/material.dart';
import 'package:ios_calculator/widgets/button.dart';
import 'package:ios_calculator/widgets/wideButton.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    const operatorColor = Color(0xffF1A33B);
    const singleOperatorColor = Colors.grey;

    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ButtonCalc('%', color: singleOperatorColor),
            ButtonCalc('7'),
            ButtonCalc('4'),
            ButtonCalc('1'),
            ButtonCalc('AC', color: singleOperatorColor),
          ],
        ),
        Column(
          children: [
            ButtonCalc('±', color: singleOperatorColor),
            ButtonCalc('8'),
            ButtonCalc('5'),
            ButtonCalc('2'),
            ButtonCalc('0'),
          ],
        ),
        Column(
          children: [
            ButtonCalc('-', color: operatorColor),
            ButtonCalc('9'),
            ButtonCalc('6'),
            ButtonCalc('3'),
            ButtonCalc('.'),
          ],
        ),
        Column(
          children: [
            ButtonCalc('×', color: operatorColor),
            WidebuttonCalc('+', color: operatorColor),
            WidebuttonCalc('=', color: operatorColor),
          ],
        ),
      ],
    );
  }
}
