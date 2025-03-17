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
            const EdgeInsets.only(right: 50, bottom: 10, top: 10, left: 40),
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            if (state is CalcInitial) {
              return Text(
                state.display,
                style: Theme.of(context).textTheme.displayLarge,
              );
            } else if (state is DisplayNumber) {
              return Text(
                state.display,
                style: Theme.of(context).textTheme.displayLarge,
              );
            } else if (state is DisplayResult) {
              return Text(
                state.display,
                style: Theme.of(context).textTheme.displayLarge,
              );
            } else if (state is ErrorState) {
              return Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.displayLarge,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
