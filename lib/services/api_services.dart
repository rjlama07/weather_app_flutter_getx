import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatheria/constrains/api.dart';
import 'package:weatheria/models/weather_data_model.dart';

class API {
  Future<WeatherModel> getData() async {
    var response = await http.get(Uri.parse(api));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(data);
    } else {
      return WeatherModel.fromJson(data);
    }
  }
}
