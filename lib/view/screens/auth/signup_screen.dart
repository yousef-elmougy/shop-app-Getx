// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// Project imports:
import '../../../core/routes/routes.dart';
import '../../../core/utils/colors_manger.dart';
import '../../../core/utils/my_string.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_massage_button.dart';
import '../../widgets/custom_material_button.dart';
import '../../widgets/custom_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text:  TextSpan(
                            children: [
                              const TextSpan(
                                text: 'SIGN',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 35,
                                ),
                              ),
                              TextSpan(
                                text: 'UP',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Get.isDarkMode? Colors.white: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      keyBoardType: TextInputType.name,
                      hintText: 'User Name',
                      // onChange: (val) {},
                      prefixIcon: FontAwesomeIcons.userLarge,
                      controller: nameController,
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value!)) {
                          return 'Enter valid name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      keyBoardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      // onChange: (val) {},
                      prefixIcon: Icons.email,
                      controller: emailController,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value!)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return CustomTextFormField(
                        suffixIcon: IconButton(
                          splashRadius: 1,
                          icon: controller.isVisibility
                              ? const Icon(
                                  Icons.visibility,
                                  color: mainColor,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            controller.visibility();
                          },
                        ),
                        obscureText: controller.isVisibility ? false : true,
                        keyBoardType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        // onChange: (val) {},
                        prefixIcon: FontAwesomeIcons.lock,
                        controller: passwordController,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomCheckBox(),
                        CustomTextButton(
                          text: '    I accept ',
                          textButton: 'terms & conditions',
                          onPressed: () {},
                          textColor: Get.isDarkMode? Colors.white: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return CustomMaterialButton(
                        onPressed: () {
                          if (controller.isCheck == false) {
                            Get.snackbar(
                              'CheckBox',
                              'accept terms & conditions',
                              duration: const Duration(seconds: 3),
                            );
                          }
                         else if (_formKey.currentState!.validate()) {
                            String name = nameController.text.trim();
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            controller.signUpWithFirebase(
                              myUserName: name,
                              myEmail: email,
                              myPassword: password,
                            );
                            controller.isCheck == true;
                          }
                        },
                        text: 'SIGN UP',
                        fontSize: 15,
                        width: 295,
                        height: 45,
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 95,
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: CustomTextButton(
                textColor: Colors.white,
                text: "Already have an Account? ",
                textButton: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
