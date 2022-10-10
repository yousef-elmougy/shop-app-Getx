// Flutter imports:
import 'package:flutter/material.dart';

import '../../core/utils/colors_manger.dart';


// Project imports:

class CustomMaterialButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  // final Color textColor;
  // Color bottomColor = mainColor;
  final double fontSize;
  final double width;
  final double height;

  // final BorderRadius borderRadius;

  CustomMaterialButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.fontSize,
    // required this.textColor,
    // required this.bottomColor ,
    required this.width,
    required this.height,
    // required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
