// Package imports:
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

// Project imports:

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}
