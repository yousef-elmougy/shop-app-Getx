// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/logic/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
  }
}
