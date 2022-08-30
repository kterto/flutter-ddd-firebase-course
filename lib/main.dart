import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd_course/firebase_options.dart';
import 'package:notes_firebase_ddd_course/injection.dart';
import 'package:notes_firebase_ddd_course/presentation/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureInjection(Environment.prod);

  runApp(const AppWidget());
}
