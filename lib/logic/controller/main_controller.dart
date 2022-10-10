// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/view/screens/category_screen.dart';
import 'package:asroo/view/screens/favorite_screen.dart';
import 'package:asroo/view/screens/home_screen.dart';
import 'package:asroo/view/screens/settings_screen.dart';

class MainController extends GetxController{

   int currentIndex = 0;
void onTapScreens(int index){
   currentIndex = index;
   update();
}

}
