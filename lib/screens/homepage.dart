import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weatheria/controller/apicontroller.dart';
import 'package:weatheria/controller/dark_mode_controller.dart';
import 'package:weatheria/widget/reuseable_row.dart';
import 'package:weatheria/widget/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var darkModeController = Get.find<DarkModeController>();
    var controller = Get.put(ApiController());
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[900]
          : Colors.grey[200],
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => controller.fetchData(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Weatheria",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Monday, 24 Aug",
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.grey[200],
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Obx(
                        () => Switch(
                            value: darkModeController.isDark.value,
                            onChanged: (value) =>
                                darkModeController.onChange(value)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SearchBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () => controller.search(),
                        child: const Text("Search")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => controller.isloading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.weatherData.value.name.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Center(
                                child: Column(
                              children: [
                                Image.network(
                                  "https://openweathermap.org/img/w/${controller.weatherData.value.weather![0].icon}.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  controller.weatherData.value.main!.temp
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  controller.weatherData.value.weather![0].main
                                      .toString()
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                            const SizedBox(
                              height: 80,
                            ),
                            Obx(
                              () => Column(
                                children: [
                                  ReuseableRow(
                                      title: "Humidity",
                                      info: controller
                                          .weatherData.value.main!.humidity
                                          .toString()),
                                  ReuseableRow(
                                      title: "Pressure",
                                      info: controller
                                          .weatherData.value.main!.pressure
                                          .toString()),
                                  ReuseableRow(
                                      title: "Windspeed",
                                      info: controller
                                          .weatherData.value.wind!.speed
                                          .toString()),
                                ],
                              ),
                            )
                          ],
                        ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
