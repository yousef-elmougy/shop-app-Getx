import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ThemeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
  }
}