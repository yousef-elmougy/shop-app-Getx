// Package imports:
import 'package:asroo/logic/binding/theme_binding.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:asroo/logic/binding/main_binding.dart';
import 'package:asroo/logic/binding/product_binding.dart';
import '../../logic/binding/auth_binding.dart';
import '../../view/screens/auth/login_screen.dart';
import '../../view/screens/auth/password_screen.dart';
import '../../view/screens/auth/signup_screen.dart';
import '../../view/screens/layout_screen.dart';
import '../../view/screens/welcome_screen.dart';

abstract class AppRoutes {
  static const String welcome = Routes.welcome;
  static const String mainScreen = Routes.mainScreen;

  static final List<GetPage<dynamic>>? routes = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.password,
      page: () => PasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.mainScreen, page: () => LayoutScreen(), bindings: [
      ProductBinding(),
      AuthBinding(),
      MainBinding(),
      ThemeBinding(),
    ]),


  ];
}

abstract class Routes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String password = '/password';
  static const String mainScreen = '/mainScreen';
}
