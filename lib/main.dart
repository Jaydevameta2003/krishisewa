import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:krishisewa/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:krishisewa/src/repository/authentication_repository/authentication_repository.dart';
import 'app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

