import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class DarkModeController extends GetxController {
  final myBox = Hive.box("themeData");
  RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    myBox.get(1) != null ? isDark.value = myBox.get(1) : isDark.value = false;
  }

  void onChange(bool value) {
    isDark.value = value;
    myBox.put(1, value);
  }
}
