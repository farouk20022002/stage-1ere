import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fro9/data/repositories/authentication_repository.dart';
import 'package:fro9/features/personalization/models/user_model.dart';
import 'package:fro9/utils/exceptions/firebase_exceptions.dart';
import 'package:fro9/utils/exceptions/format_exceptions.dart';
import 'package:fro9/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUSerRecord(UserModel user) async {
    print("D5alna ll sauvegarde fl firestore");
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (h) {
      throw TFirebaseException(h.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please Try again';
    }
  }

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please Try again';
    }
  }

  Future<void> updateUserDetails(UserModel updatedUser) async {
    print("D5alna ll update fl firestore");
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (h) {
      throw TFirebaseException(h.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please Try again';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    print("D5alna ll update fl firestore");
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (h) {
      throw TFirebaseException(h.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please Try again';
    }
  }

  Future<void> removeUserRecord(String userId) async {
    print("D5alna ll delete fl firestore");
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (h) {
      throw TFirebaseException(h.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please Try again';
    }
  }
}
