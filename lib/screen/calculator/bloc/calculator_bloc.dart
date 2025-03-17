/// A `Bloc` implementation for managing calculator operations and states.
///
/// The `CalculatorBloc` handles various calculator events such as number input,
/// arithmetic operations, clearing the display, changing the sign of a number,
/// calculating percentages, and adding decimal points. It emits corresponding
/// states to update the UI based on the user's actions.
///
/// ### Events Handled:
/// - `OnPressNumber`: Appends a number to the current input (left or right operand).
/// - `OnPressAdd`: Sets the operator to addition.
/// - `OnPressSubtract`: Sets the operator to subtraction.
/// - `OnPressMultiply`: Sets the operator to multiplication.
/// - `OnPressEqual`: Computes the result of the operation.
/// - `OnPressAllClear`: Resets the calculator to its initial state.
/// - `OnPressSignChange`: Toggles the sign of the current input (positive/negative).
/// - `OnPressPercentage`: Converts the current input to a percentage.
/// - `OnPressDecimalPoint`: Adds a decimal point to the current input.
///
/// ### States Emitted:
/// - `CalcInitial`: The initial state of the calculator.
/// - `DisplayNumber`: Displays the current number being input.
/// - `DisplayResult`: Displays the result of a calculation.
/// - `ErrorState`: Displays an error message in case of an exception.
///
/// ### Internal Variables:
/// - `tmpNumberLeft`: Stores the left operand.
/// - `tmpNumberRight`: Stores the right operand.
/// - `tmpOperator`: Stores the selected operator.
/// - `tmpResult`: Stores the result of the calculation.
///
/// ### Error Handling:
/// If an exception occurs during event handling, the bloc emits an `ErrorState`
/// with a generic error message.
///
/// This bloc is designed to handle basic calculator functionality and ensures
/// that the UI is updated in response to user interactions.
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalcInitial()) {
    // Temporary variables to store operands, operator, and result
    String? tmpNumberLeft;
    String? tmpNumberRight;
    String? tmpOperator;
    String? tmpResult;

    // Event handler for all calculator events
    on<CalculatorEvent>((event, emit) {
      try {
        // Handle number input for the left operand
        if (tmpOperator == null) {
          if (event is OnPressNumber) {
            if (tmpNumberLeft == null || tmpNumberLeft!.length < 9) {
              tmpNumberLeft = (tmpNumberLeft ?? '') + event.number;
              emit(DisplayNumber(tmpNumberLeft!));
            }
          }
        }

        // Handle number input for the right operand
        if (tmpOperator != null) {
          if (event is OnPressNumber) {
            if (tmpNumberRight == null || tmpNumberRight!.length < 9) {
              tmpNumberRight = (tmpNumberRight ?? '') + event.number;
              emit(DisplayNumber(tmpNumberRight!));
            }
          }
        }

        // Handle arithmetic operations and set the operator
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

          // Perform the calculation if both operands and operator are available
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

        // Handle the equal operation to finalize the calculation
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

        // Handle the "All Clear" operation to reset the calculator
        if (event is OnPressAllClear) {
          tmpNumberLeft = null;
          tmpNumberRight = null;
          tmpOperator = null;
          tmpResult = null;
          emit(CalcInitial());
        }

        // Handle sign change for the current operand
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

        // Handle percentage conversion for the current operand
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

        // Handle adding a decimal point to the current operand
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
        // Emit an error state in case of an exception
        emit(const ErrorState('error'));
      }
    });
  }
}
