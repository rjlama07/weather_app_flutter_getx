import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:weatheria/models/weather_data_model.dart';
import 'package:weatheria/services/api_services.dart';

import '../constrains/api.dart';

class ApiController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  RxBool isCityfound = false.obs;
  RxString city = "kathmandu".obs;

  RxString url =
      "https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&units=metric&appid=be7ee777fd9edabedc1e0465133be3a8"
          .obs;

  Rx<TextEditingController> controller = TextEditingController().obs;

  void search() {
    url.value =
        "https://api.openweathermap.org/data/2.5/weather?q=${city.value}&units=metric&appid=be7ee777fd9edabedc1e0465133be3a8";
    api = url.value;
    fetchData();
  }

  Rx<WeatherModel> weatherData = WeatherModel().obs;
  RxBool isloading = true.obs;
  Future<void> fetchData() async {
    isloading.value = true;
    weatherData.value = await API().getData();
    isloading.value = false;
  }
}
