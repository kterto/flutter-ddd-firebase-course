import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_firebase_ddd_course/domain/auth/i_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (event) => _onAuthCheckRequested(event, emit),
        signedOut: (event) => _onSignedOut(event, emit),
      );
    });
  }

  Future<void> _onAuthCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    final userOption = await _authFacade.getSignedInUser();

    userOption.fold(
      () => emit(const Unauthenticated()),
      (user) => emit(const Authenticated()),
    );
  }

  Future<void> _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    await _authFacade.signOut();
    emit(const Unauthenticated());
  }
}
