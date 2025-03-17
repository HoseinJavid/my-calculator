part of 'calculator_bloc.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

final class CalcInitial extends CalculatorState {
  final String display = "0";
}

final class DisplayNumber extends CalculatorState {
  final String display;

  const DisplayNumber(this.display);

  @override
  List<Object> get props => [display];
}

final class ErrorState extends CalculatorState {
  final String errorMessage;

  const ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class DisplayResult extends CalculatorState {
  final String display;

  const DisplayResult(this.display);

  @override
  List<Object> get props => [display];
}
