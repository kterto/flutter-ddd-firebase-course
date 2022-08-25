import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:notes_firebase_ddd_course/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
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
  ) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccessOption: const None(),
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignInFormState> emit,
  ) {
    emit(
      state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccessOption: const None(),
      ),
    );
  }

  void _onRegisterWithEmailAndPasswordPressed(
    RegisterWithEmailAndPasswordPressed event,
    Emitter<SignInFormState> emit,
  ) async {
    _performActionOnAuthFacadeWithEmailAndPassword(
      emit: emit,
      forwardedCall: _authFacade.registerWithEmailAndPassword,
    );
  }

  void _onSignInWithEmailAndPasswordPressed(
    SignInWithEmailAndPasswordPressed event,
    Emitter<SignInFormState> emit,
  ) async {
    _performActionOnAuthFacadeWithEmailAndPassword(
      emit: emit,
      forwardedCall: _authFacade.signInWithEmailAndPassword,
    );
  }

  void _onSignInWithGooglePressed(
    SignInWithGooglePressed event,
    Emitter<SignInFormState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: const None(),
      ),
    );

    final failureOrSuccess = await _authFacade.signInWithGoggle();

    emit(state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: Some(failureOrSuccess),
    ));
  }

  void _performActionOnAuthFacadeWithEmailAndPassword({
    required Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress email,
      required Password password,
    })
        forwardedCall,
    required Emitter<SignInFormState> emit,
  }) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (state.emailAddress.isValid() && state.password.isValid()) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: const None(),
        ),
      );

      failureOrSuccess = await forwardedCall(
        email: state.emailAddress,
        password: state.password,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
