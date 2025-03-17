import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalcInitial()) {
    String? tmpNumberLeft;
    String? tmpNumberRight;
    String? tmpOperator;
    String? tmpResult;
    on<CalculatorEvent>((event, emit) {
      try {
        if (tmpOperator == null) {
          if (event is OnPressNumber) {
            if (tmpNumberLeft == null || tmpNumberLeft!.length < 9) {
              tmpNumberLeft = (tmpNumberLeft ?? '') + event.number;
              emit(DisplayNumber(tmpNumberLeft!));
            }
          }
        }

        if (tmpOperator != null) {
          if (event is OnPressNumber) {
            if (tmpNumberRight == null || tmpNumberRight!.length < 9) {
              tmpNumberRight = (tmpNumberRight ?? '') + event.number;
              emit(DisplayNumber(tmpNumberRight!));
            }
          }
        }
        if (event is OnPressAdd ||
            event is OnPressSubtract ||
            event is OnPressMultiply ||
            event is OnPressEqual) {
          if (event is OnPressAdd) {
            tmpOperator = '+';
          } else if (event is OnPressSubtract) {
            tmpOperator = '-';
          } else if (event is OnPressMultiply) {
            tmpOperator = '*';
          }
          if (tmpNumberLeft != null &&
              tmpNumberRight != null &&
              tmpOperator != null) {
            if (tmpOperator == '+') {
              double result =
                  double.parse(tmpNumberLeft!) + double.parse(tmpNumberRight!);
              tmpResult = result % 1 == 0
                  ? result.toInt().toString()
                  : result.toString();
              tmpNumberLeft = tmpResult;
              tmpNumberRight = null;
              emit(DisplayResult(tmpResult!));
            } else if (tmpOperator == '-') {
              double result =
                  double.parse(tmpNumberLeft!) - double.parse(tmpNumberRight!);
              tmpResult = result % 1 == 0
                  ? result.toInt().toString()
                  : result.toString();
              tmpNumberLeft = tmpResult;
              tmpNumberRight = null;
              emit(DisplayResult(tmpResult!));
            } else if (tmpOperator == '*') {
              double result =
                  double.parse(tmpNumberLeft!) * double.parse(tmpNumberRight!);
              tmpResult = result % 1 == 0
                  ? result.toInt().toString()
                  : result.toString();
              tmpNumberLeft = tmpResult;
              tmpNumberRight = null;
              emit(DisplayResult(tmpResult!));
            }
          }
        }
        if (event is OnPressEqual) {
          if (tmpNumberLeft != null &&
              tmpNumberRight != null &&
              tmpOperator != null) {
            if (tmpOperator == '+') {
              double result =
                  double.parse(tmpNumberLeft!) + double.parse(tmpNumberRight!);
              tmpResult = result % 1 == 0
                  ? result.toInt().toString()
                  : result.toString();
              tmpNumberLeft = null;
              tmpNumberRight = null;
              tmpOperator = null;
              emit(DisplayResult(tmpResult!));
            } else if (tmpOperator == '-') {
              double result =
                  double.parse(tmpNumberLeft!) - double.parse(tmpNumberRight!);
              tmpResult = result % 1 == 0
                  ? result.toInt().toString()
                  : result.toString();
              tmpNumberLeft = null;
              tmpNumberRight = null;
              tmpOperator = null;
              emit(DisplayResult(tmpResult!));
            } else if (tmpOperator == '*') {
              double result =
                  double.parse(tmpNumberLeft!) * double.parse(tmpNumberRight!);
              tmpResult = result % 1 == 0
                  ? result.toInt().toString()
                  : result.toString();
              tmpNumberLeft = null;
              tmpNumberRight = null;
              tmpOperator = null;
              emit(DisplayResult(tmpResult!));
            }
          }
        }

        if (event is OnPressAllClear) {
          tmpNumberLeft = null;
          tmpNumberRight = null;
          tmpOperator = null;
          tmpResult = null;
          emit(CalcInitial());
        }

        if (event is OnPressSignChange) {
          if (tmpOperator == null && tmpNumberLeft != null) {
            if (tmpNumberLeft!.startsWith('-')) {
              tmpNumberLeft = tmpNumberLeft!.substring(1);
            } else {
              tmpNumberLeft = '-$tmpNumberLeft';
            }
            emit(DisplayNumber(tmpNumberLeft!));
          } else if (tmpOperator != null && tmpNumberRight != null) {
            if (tmpNumberRight!.startsWith('-')) {
              tmpNumberRight = tmpNumberRight!.substring(1);
            } else {
              tmpNumberRight = '-$tmpNumberRight';
            }
            emit(DisplayNumber(tmpNumberRight!));
          }
        }

        if (event is OnPressPercentage) {
          if (tmpNumberLeft != null) {
            tmpNumberLeft = (double.parse(tmpNumberLeft!) / 100).toString();
            emit(DisplayNumber(tmpNumberLeft!));
          }
          if (tmpNumberRight != null) {
            tmpNumberRight = (double.parse(tmpNumberRight!) / 100).toString();
            emit(DisplayNumber(tmpNumberRight!));
          }
        }

        if (event is OnPressDecimalPoint) {
          if (tmpNumberLeft != null && tmpOperator == null) {
            tmpNumberLeft = '${tmpNumberLeft!}.';
            emit(DisplayNumber(tmpNumberLeft!));
          }
          if (tmpNumberRight != null && tmpOperator != null) {
            tmpNumberRight = '${tmpNumberRight!}.';
            emit(DisplayNumber(tmpNumberRight!));
          }
        }
      } catch (e) {
        emit(const ErrorState('error'));
      }
    });
  }
}
