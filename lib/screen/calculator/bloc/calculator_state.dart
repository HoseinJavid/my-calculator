part of 'calculator_bloc.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();
  
  @override
  List<Object> get props => [];
}

final class CalculatorInitial extends CalculatorState {
  final String display = "0";
}
