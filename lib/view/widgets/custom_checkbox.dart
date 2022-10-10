// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// Project imports:
import '../../core/utils/colors_manger.dart';
import '../../logic/controller/auth_controller.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
   return GetBuilder<AuthController>(
      builder: (_){
        return  Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: formGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RawMaterialButton(
            splashColor: Colors.transparent,
            onPressed: () {
              controller.checkBox();
            },
            child:controller.isCheck? const Icon(
              FontAwesomeIcons.check,
              color: mainColor,
              size: 30,
            ):Container(),
          ),
        );
      },
    );
  }
}
