// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import '../../core/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheck = false;

  ///************************
  FirebaseAuth auth = FirebaseAuth.instance;
  String? userName;
  String? userPhoto;
  GoogleSignIn googleSignIn = GoogleSignIn();

  ///************************
  final _box = GetStorage();
  final _key = 'isSigning';
  bool isSigning = true;

  ///************************

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }

  ///  SIGNUP
  signUpWithFirebase({
    required String myUserName,
    required String myEmail,
    required String myPassword,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: myEmail,
        password: myPassword,
      )
          .then((value) {
        userName = myUserName;
        return auth.currentUser?.updateDisplayName(myUserName);
      });
      isSigning = true;
      _box.write(_key, isSigning);
      update();
      _successMessage(title: 'Sign up');
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      _loginAndSignupException(
        e: e,
        codeTitleOne: 'weak-password',
        codeTitleMessageOne: 'The password provided is too weak.',
        codeTitleTwo: 'email-already-in-use',
        codeTitleMessageTwo: 'The account already exists for that email.',
      );
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  /// LOGIN

  loginWithFirebase(
      {required String myEmail, required String myPassword}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: myEmail, password: myPassword)
          .then((value) {
        return userName = auth.currentUser?.displayName;
      });
      isSigning = true;
      _box.write(_key, isSigning);
      update();
      _successMessage(title: 'Log in');
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      _loginAndSignupException(
        e: e,
        codeTitleOne: 'user-not-found',
        codeTitleMessageOne: 'No user found for that email.',
        codeTitleTwo: 'wrong-password',
        codeTitleMessageTwo: 'Wrong password provided for that user.',
      );
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  /// SEND PASSWORD

  sendPassword({required String myEmail}) async {
    try {
      await auth.sendPasswordResetEmail(email: myEmail);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          e.code.replaceAll(RegExp('-'), ' '),
          'No user found for that email.',
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

  ///  GOOGLE LOGIN

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigning = true;
      _box.write(_key, isSigning);
      update();
      Get.offAllNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  ///  FACEBOOK LOGIN

  loginWithFacebook() async {

      try {
        final LoginResult loginResult = await FacebookAuth.instance.login();

        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        isSigning = true;
    _box.write(_key, isSigning);
    update();
    Get.offAllNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar('error', e.toString());
    }


  }

  ///   SIGN OUT

  signOutWithFirebase() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    await FacebookAuth.instance.logOut();
    Get.offNamed(Routes.welcome);
    isSigning = false;
    _box.remove(_key);
    update();
  }
}

void _loginAndSignupException({
  required FirebaseAuthException e,
  required String codeTitleOne,
  required String codeTitleMessageOne,
  required String codeTitleTwo,
  required String codeTitleMessageTwo,
}) {
  if (e.code == codeTitleOne) {
    Get.snackbar(
      e.code.replaceAll(RegExp('-'), ' '),
      codeTitleMessageOne,
      duration: const Duration(seconds: 5),
    );
  } else if (e.code == codeTitleTwo) {
    Get.snackbar(
      e.code.replaceAll(RegExp('-'), ' '),
      codeTitleMessageTwo,
      duration: const Duration(seconds: 5),
    );
  }
}

void _successMessage({required String title}) {
  Get.snackbar(
    'Success',
    '$title Succeed',
    duration: const Duration(seconds: 5),
  );
}
