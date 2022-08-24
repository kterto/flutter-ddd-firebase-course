import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd_course/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>(
      (event, emit) {
        event.map(
          emailChanged: (event) => _onEmailChanged(event, emit),
          passwordChanged: (event) => _onPasswordChanged(event, emit),
          registerWithEmailAndPasswordPressed: (event) =>
              _onRegisterWithEmailAndPasswordPressed(event, emit),
          signInWithEmailAndPasswordPressed: (event) =>
              _onSignInWithEmailAndPasswordPressed(event, emit),
          signInWithGooglePressed: (event) =>
              _onSignInWithGooglePressed(event, emit),
        );
      },
    );
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<SignInFormState> emit,
  ) {}

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignInFormState> emit,
  ) {}

  void _onRegisterWithEmailAndPasswordPressed(
    RegisterWithEmailAndPasswordPressed event,
    Emitter<SignInFormState> emit,
  ) {}

  void _onSignInWithEmailAndPasswordPressed(
    SignInWithEmailAndPasswordPressed event,
    Emitter<SignInFormState> emit,
  ) {}

  void _onSignInWithGooglePressed(
    SignInWithGooglePressed event,
    Emitter<SignInFormState> emit,
  ) {}
}
