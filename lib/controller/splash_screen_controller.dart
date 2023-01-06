import 'dart:async';

import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 1), () {
      Get.toNamed('/homepage');
    });
  }
}
