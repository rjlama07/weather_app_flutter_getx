import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatheria/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: deviceHeight * 0.30,
          ),
          SizedBox(
            height: deviceHeight * 0.2,
          ),
          const CircularProgressIndicator(
            color: Colors.green,
          )
        ],
      )),
    );
  }
}
