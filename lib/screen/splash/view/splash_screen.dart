import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => Get.offAllNamed('home'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                Color(0xff4285F4),
                Color(0xff373598),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/image/Logo.png",height: 200,),
                // const Text(
                //   "Zee Quotes",
                //   style: TextStyle(
                //       fontSize: 30,
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold),
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Zee Quotes',
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontFamily: "Italic",
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 300), colors: [Colors.white,Color(0xff373598)],
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}