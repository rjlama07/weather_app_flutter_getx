import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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

  @override
  void dispose() {
    super.dispose();
    controller;
  }

  RxBool isTyping = false.obs;
  RxBool isCityfound = false.obs;
  RxString city = "kathmandu".obs;

  RxString url =
      "https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&units=metric&appid=be7ee777fd9edabedc1e0465133be3a8"
          .obs;

  Rx<TextEditingController> controller = TextEditingController().obs;

  // Widget suffixIcon(){
  //  controller.value,isblan
  // }

  void search() {
    url.value =
        "https://api.openweathermap.org/data/2.5/weather?q=${city.value}&units=metric&appid=be7ee777fd9edabedc1e0465133be3a8";
    api = url.value;

    fetchData();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  void onchangedController(String searchContent) {
    if (searchContent.isNotEmpty) {
      city.value = searchContent;
      isTyping.value = true;
    } else {
      isTyping.value = false;
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  Rx<WeatherModel> weatherData = WeatherModel().obs;
  RxBool isloading = true.obs;
  Future<void> fetchData() async {
    isloading.value = true;
    isCityfound = false.obs;
    weatherData.value = await API().getData();
    if (weatherData.value.cod == "404") {
      isCityfound.value = false;
      isloading.value = false;
    } else {
      isCityfound.value = true;
    }

    isloading.value = false;
  }
}
