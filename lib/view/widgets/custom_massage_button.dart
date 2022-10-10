// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
     required this.textButton,
    required this.onPressed,
     required this.textColor,
  }) : super(key: key);

   String textButton;
  final String text;
  final void Function() onPressed;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:  TextStyle(
            color: textColor ,
            fontSize: 15,
          ),
        ),
        TextButton(
          child: Text(
            textButton,
            style:  TextStyle(
              color: textColor,
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
