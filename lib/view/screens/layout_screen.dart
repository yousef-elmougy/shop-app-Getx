// Flutter imports:
import 'package:asroo/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/logic/controller/main_controller.dart';
import '../../logic/controller/theme_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.find<MainController>();
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: CustomBottomNavBar(mainController: mainController),
      body: GetBuilder<MainController>(
        builder: (_) {
          return IndexedStack(
            index: mainController.currentIndex,
            children: [
              HomeScreen(),
              CategoryScreen(),
              FavoriteScreen(),
              SettingsScreen(),
            ],
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Shop App',
      ),
      leading: GetBuilder<ThemeController>(
        builder: (_) {
          return IconButton(
            icon: Icon(
                themeController.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              themeController.switchTheme();
            },
          );
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}

