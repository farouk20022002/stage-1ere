import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fro9/features/authentification/screens/login/login.dart';
import 'package:fro9/features/authentification/screens/onboarding/onboarding.dart';
import 'package:fro9/features/authentification/screens/signup/verify_email.dart';
import 'package:fro9/navigation_menu.dart';
import 'package:fro9/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:fro9/utils/exceptions/firebase_exceptions.dart';
import 'package:fro9/utils/exceptions/format_exceptions.dart';
import 'package:fro9/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      print({deviceStorage.read('isFirstTime')});
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
      print({deviceStorage.read('isFirstTime')});
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wromg, PLease try again";
    }
    throw "Something went wromg, PLease try again";
  }

  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wromg, PLease try again";
    }
    return null;
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wromg, PLease try again";
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wromg, PLease try again";
    }
  }
}
