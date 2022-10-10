// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import '../../core/routes/routes.dart';
import '../../core/utils/colors_manger.dart';
import '../widgets/custom_massage_button.dart';
import '../widgets/custom_material_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                 Text(
                  'welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Get.isDarkMode? Colors.white: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text:  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Shop ',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'App',
                        style: TextStyle(
                          color:Get.isDarkMode? Colors.white: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                CustomMaterialButton(
                  onPressed: () {
                    Get.offNamed(Routes.login);
                  },
                  text: 'Get Start',
                  fontSize: 30,
                  width: 180,
                  height: 55,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextButton(
                  textColor:Get.isDarkMode? Colors.white: Colors.black,
                  text: "Don't have an Account? ",
                  textButton: 'Sign Up',
                  onPressed: () {
                    Get.offNamed(Routes.signup);
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


