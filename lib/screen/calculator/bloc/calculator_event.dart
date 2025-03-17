part of 'calculator_bloc.dart';

sealed class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

final class OnPressAdd extends CalculatorEvent {} // +

final class OnPressSubtract extends CalculatorEvent {} // -

final class OnPressMultiply extends CalculatorEvent {} // *

final class OnPressDivide extends CalculatorEvent {} // /

final class OnPressEqual extends CalculatorEvent {} // =

final class OnPressDecimalPoint extends CalculatorEvent {} // .

final class OnPressPercentage extends CalculatorEvent {} // %

final class OnPressSignChange extends CalculatorEvent {} // ±

final class OnPressAllClear extends CalculatorEvent {} // AC

final class OnPressNumber extends CalculatorEvent { // 0-9
  final String number;

  const OnPressNumber(this.number);

  @override
  List<Object> get props => [number];
}
