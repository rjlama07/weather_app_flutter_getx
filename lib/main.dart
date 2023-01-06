import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatheria/controller/dark_mode_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatheria/screens/homepage/homepage.dart';
import 'package:weatheria/screens/splashpage/splash.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("themeData");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DarkModeController());
    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness:
                controller.isDark.value ? Brightness.dark : Brightness.light,
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          getPages: [
            GetPage(name: "/homepage", page: () => const HomePage()),
            GetPage(
              name: "/splashScreen",
              page: () => const SplashScreen(),
            )
          ],
          initialRoute: "/splashScreen",
        ));
  }
}
