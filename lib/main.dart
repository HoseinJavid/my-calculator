import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/screen/calculator/bloc/calculator_bloc.dart';
import 'package:ios_calculator/screen/calculator/calculator.dart';
import 'package:ios_calculator/screen/splash/splash.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          headlineLarge:
              TextStyle(fontFamily: 'sPro', fontSize: 26, color: Colors.white),
          displayLarge:
              TextStyle(fontFamily: 'sPro', fontSize: 90, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.white.withOpacity(0.3); // Change on press color
                }
                return null; // Default color
              },
            ),
          ),
        ),
        colorScheme: const ColorScheme.dark(
            primary: Color(0xff333333),
            secondary: Color(0xffF1A33B),
            tertiary: Colors.grey,
            surface: Colors.black),
      ),
      home: const SplashScreen(),
    );
  }
}
