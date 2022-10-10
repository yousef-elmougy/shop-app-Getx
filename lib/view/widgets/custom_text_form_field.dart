// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// Project imports:
import '../../core/utils/colors_manger.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.validator,
    // required this.onChange,
    required this.keyBoardType,
    required this.hintText,
    this.obscureText,
    required this.prefixIcon,
    required this.controller, this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;

  final String? Function(String?)? validator;
  // final String? Function(String?)? onChange;
  final TextInputType keyBoardType;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.theme.textTheme;

    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      // onChanged: onChange,
      keyboardType: keyBoardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor:formGrey ,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            child: FaIcon(
              prefixIcon,
              color: mainColor,
              size: 20,
            ),
            radius: 3,
            backgroundColor: Colors.white,
          ),
        ),
        hintText: hintText,
        hintStyle: textTheme.titleSmall,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
