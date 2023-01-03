import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weatheria/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      getPages: [GetPage(name: "/homepage", page: () => const HomePage())],
      initialRoute: "/homepage",
    );
  }
}
