import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.green[800],
        colorScheme: ThemeData.light().colorScheme.copyWith(
              primary: Colors.green[800],
              secondary: Colors.blueAccent,
            ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      home: const SignInPage(),
    );
  }
}
