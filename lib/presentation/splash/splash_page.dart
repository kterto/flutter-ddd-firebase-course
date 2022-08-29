import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _listener,
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    state.when(
      initial: () {},
      authenticated: () {
        print("I am authenticated");
      },
      unauthenticated: () {
        AutoRouter.of(context).replaceNamed('/sign-in-page');
      },
    );
  }
}
