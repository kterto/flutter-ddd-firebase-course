import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: _listener,
      builder: _buider,
    );
  }

  void _listener(BuildContext context, SignInFormState state) {
    state.authFailureOrSuccessOption.fold(
      () {},
      (either) => either.fold(
        (failure) {
          FlushbarHelper.createError(
            message: failure.map(
              canceledByUser: (_) => 'Cancelled',
              serverError: (_) => 'Server error',
              emailAlreadyInUse: (_) => 'Email already in use',
              invalidEmailAndPasswordCombination: (_) =>
                  'Invalid email and password combination',
            ),
          ).show(context);
        },
        (_) {
          // TODO: Navigate
        },
      ),
    );
  }

  Widget _buider(BuildContext context, SignInFormState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      child: Form(
        autovalidateMode: state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: ListView(
          children: [
            const Text(
              '📔',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 130),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              autocorrect: false,
              onChanged: (value) =>
                  BlocProvider.of<SignInFormBloc>(context).add(
                EmailChanged(value),
              ),
              validator: (_) => state.emailAddress.value.fold(
                (l) => l.maybeWhen(
                  invalidEmail: (_) => 'Invalid Email',
                  orElse: () => null,
                ),
                (r) => null,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              autocorrect: false,
              obscureText: true,
              onChanged: (value) =>
                  BlocProvider.of<SignInFormBloc>(context).add(
                PasswordChanged(value),
              ),
              validator: (_) => state.password.value.fold(
                (l) => l.maybeWhen(
                  shortPassword: (_) => 'Short Password',
                  orElse: () => null,
                ),
                (r) => null,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<SignInFormBloc>(context).add(
                        const SignInWithEmailAndPasswordPressed(),
                      );
                    },
                    child: const Text('SIGN IN'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<SignInFormBloc>(context).add(
                        const RegisterWithEmailAndPasswordPressed(),
                      );
                    },
                    child: const Text('REGISTER'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInWithGooglePressed(),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.lightBlue,
                ),
              ),
              child: const Text(
                "SIGN IN WITH GOOGLE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
