import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/homepage.dart';

class GameSplashScreen extends StatefulWidget {
  const GameSplashScreen({super.key});

  @override
  State<GameSplashScreen> createState() => _GameSplashScreenState();
}

class _GameSplashScreenState extends State<GameSplashScreen> {
  @override
  void didChangeDependencies() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePageScreen(),
        ),
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.black,
                  Color.fromARGB(255, 3, 18, 43),
                  Colors.black,
                ])),
            child: Center(
              child: SizedBox(
                height: size.height / 4,
                width: size.height / 4,
                child: Image.asset(
                  "assets/images/tik.svg.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
