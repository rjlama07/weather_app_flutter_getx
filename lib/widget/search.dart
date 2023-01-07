import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weatheria/controller/apicontroller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ApiController>();
    return Row(
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black54,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              onChanged: (value) {
                controller.onchangedController(value.toString());
              },
              controller: controller.controller.value,
              decoration: InputDecoration(
                  suffixIcon: Obx(() => !controller.isTyping.value
                      ? Icon(Icons.search)
                      : IconButton(
                          onPressed: () {
                            controller.controller.value.clear();
                            controller.isTyping.value = false;
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                          },
                          icon: Icon(Icons.close))),
                  border: InputBorder.none,
                  hintText: "Search City"),
            ),
          ),
        ),
        Obx(
          () => controller.isTyping.value
              ? Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? MaterialStateProperty.all(Colors.blue)
                                  : MaterialStateProperty.all(Colors.black54)),
                      onPressed: () {
                        controller.search();
                        controller.isTyping.value = false;
                      },
                      child: const Text("Search")),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
