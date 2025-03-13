import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/screen/calculator/bloc/calculator_bloc.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding:
            const EdgeInsets.only(right: 25, bottom: 10, top: 10, left: 40),
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            if (state is CalculatorInitial) {
              return Text(
                state.display,
                style: Theme.of(context).textTheme.displayLarge,
              );
            } else {
              return const Text(
                'Error',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }
}
