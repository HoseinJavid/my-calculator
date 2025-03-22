import 'package:flutter/material.dart';
import 'package:ios_calculator/widgets/button.dart';
import 'package:ios_calculator/widgets/wideButton.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color operatorColor = themeData.colorScheme.secondary;
    Color singleOperatorColor = themeData.colorScheme.tertiary;
    Color numberColor = themeData.colorScheme.primary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ButtonCalc('%', singleOperatorColor),
            ButtonCalc('7', numberColor),
            ButtonCalc('4', numberColor),
            ButtonCalc('1', numberColor),
            ButtonCalc('AC', singleOperatorColor),
          ],
        ),
        Column(
          children: [
            ButtonCalc('÷', operatorColor),
            ButtonCalc('8', numberColor),
            ButtonCalc('5', numberColor),
            ButtonCalc('2', numberColor),
            ButtonCalc('0', numberColor),
          ],
        ),
        Column(
          children: [
            ButtonCalc('-', operatorColor),
            ButtonCalc('9', numberColor),
            ButtonCalc('6', numberColor),
            ButtonCalc('3', numberColor),
            ButtonCalc('.', numberColor),
          ],
        ),
        Column(
          children: [
            ButtonCalc(
              '×',
              operatorColor,
              width: MediaQuery.of(context).size.width / 4,
            ),
            WidebuttonCalc('+', operatorColor),
            WidebuttonCalc('=', operatorColor),
          ],
        ),
      ],
    );
  }
}
