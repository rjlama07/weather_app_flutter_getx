import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatheria/controller/apicontroller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ApiController>();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        onChanged: (value) {
          String city = value.trim().toString().toLowerCase();
          controller.city.value = city;
        },
        controller: controller.controller.value,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: "Search City"),
      ),
    );
  }
}
