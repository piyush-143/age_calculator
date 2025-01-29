import 'package:age_calculator/view/home_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splash: Lottie.asset(
        'assets/calculator.json',
        fit: BoxFit.contain,
      ),
      nextScreen: const HomeView(),
      duration: 2800,
      splashIconSize: 120,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
