// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/logic/controller/main_controller.dart';
import 'package:asroo/logic/controller/theme_controller.dart';
import 'package:asroo/core/utils/theme_manger.dart';

import '../../logic/controller/auth_controller.dart';


class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return InkWell(
          child: Center(
            child: Text(
              'lkklsjklsj',
            ),
          ),
          onTap: () {
            controller.signOutWithFirebase();
          },
        );
      },
    );
  }
}
