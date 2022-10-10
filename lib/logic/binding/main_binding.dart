// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/logic/controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
