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

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthController>();

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
                                text: 'LOG ',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 35,
                                ),
                              ),
                              TextSpan(
                                text: 'IN',
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
                      keyBoardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      // onChange: (val) {},
                      prefixIcon: Icons.email,
                      controller: _emailController,
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
                          icon: _authController.isVisibility
                              ? const Icon(
                                  Icons.visibility,
                                  color: mainColor,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                ),
                          onPressed: () {
                            _authController.visibility();
                          },
                        ),
                        obscureText: _authController.isVisibility ? false : true,
                        keyBoardType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        // onChange: (val) {},
                        prefixIcon: FontAwesomeIcons.lock,
                        controller: _passwordController,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Password should be longer or equal to 6 characters';
                          } else {
                            return null;
                          }
                        },
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(
                          text: '',
                          textButton: 'Forgot Password',
                          onPressed: () {
                            Get.toNamed(Routes.password);
                          },
                          textColor: Get.isDarkMode? Colors.white: Colors.black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomCheckBox(),
                         Text(
                          '   Remember me',
                          style: TextStyle(
                            color: Get.isDarkMode? Colors.white: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomMaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text.trim();
                          String password = _passwordController.text;
                          _authController.loginWithFirebase(
                            myEmail: email,
                            myPassword: password,
                          );
                        }
                      },
                      text: 'LOG IN',
                      fontSize: 15,
                      width: 295,
                      height: 45,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: faceBook,
                            size: 30,
                          ),
                          onTap: () {
                            _authController.loginWithFacebook();
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            _authController.loginWithGoogle();
                          },
                          child: Image.asset(
                            'assets/images/google.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 51,
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
                text: "don't have an Account? ",
                textButton: 'Sign Up',
                onPressed: () {
                  Get.offNamed(Routes.signup);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
