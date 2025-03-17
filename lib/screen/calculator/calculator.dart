import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/screen/calculator/bloc/calculator_bloc.dart';
import 'package:ios_calculator/widgets/buttons.dart';
import 'package:ios_calculator/widgets/display.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const Column(
        children: [
          Display(),
          Buttons(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

void handleButtonPress(String text, BuildContext context) {
  final bloc = context.read<CalculatorBloc>();
  switch (text) {
    case 'AC':
      bloc.add(OnPressAllClear());
      break;
    case '±':
      bloc.add(OnPressSignChange());
      break;
    case '%':
      bloc.add(OnPressPercentage());
      break;
    case '=':
      bloc.add(OnPressEqual());
      break;
    case '.':
      bloc.add(OnPressDecimalPoint());
      break;
    case '+':
      bloc.add(OnPressAdd());
      break;
    case '-':
      bloc.add(OnPressSubtract());
      break;
    case '×':
      bloc.add(OnPressMultiply());
      break;
    case '÷':
      bloc.add(OnPressDivide());
      break;
    default:
      bloc.add(OnPressNumber(text));
  }
}
