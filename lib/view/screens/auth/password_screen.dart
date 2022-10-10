// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../../../core/utils/my_string.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../widgets/custom_material_button.dart';
import '../../widgets/custom_text_form_field.dart';

class PasswordScreen extends StatelessWidget {
  PasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Forgot Password',
          // style: TextStyle(color: mainColor),
        ),
        automaticallyImplyLeading: false,
        // centerTitle: true,
        // backgroundColor: Colors.white,
        // elevation: 0,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back,
            color:Get.isDarkMode? Colors.white:Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SizedBox(height: 50,),
                const Text(
                  'if you want recover your account then please provide your email ID below..',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50,),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  height: 250,
                  width: 250,
                ),
                const SizedBox(
                  height: 30,
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
                  height: 40,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return CustomMaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                         controller.sendPassword(myEmail: emailController.text.trim());
                      }
                    },
                    text: 'SEND',
                    fontSize: 15,
                    width: 305,
                    height: 45,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
