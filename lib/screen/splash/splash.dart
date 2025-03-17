import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/screen/calculator/bloc/calculator_bloc.dart';
import 'package:ios_calculator/screen/calculator/calculator.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CalculatorBloc(),
              child: const CalculatorScreen(),
            ),
          ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: Lottie.asset('assets/animation/splash/calc.json',
              controller: _animationController, onLoaded: (lottieComposition) {
        _animationController.duration = lottieComposition.duration;
        _animationController.forward();
      }, width: 500, height: 500, fit: BoxFit.contain)),
    );
  }
}
