import 'package:flutter/material.dart';
import 'package:fro9/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fro9/data/repositories/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  final deviceStorage = GetStorage();
  // ignore: unused_local_variable
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  print("Initialised");
  await GetStorage.init();
  print("Inited");
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  print({deviceStorage.read('isFirstTime')});
  print("authrepository works");
  await deviceStorage.writeIfNull('isFirstTime', true);
  runApp(const App());
  print({deviceStorage.read('isFirstTime')});
  print("APP is running");
}
