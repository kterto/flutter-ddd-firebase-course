import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_firebase_ddd_course/application/auth/auth_bloc.dart';
import 'package:notes_firebase_ddd_course/application/notes/note_actor/note_actor_bloc.dart';
import 'package:notes_firebase_ddd_course/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:notes_firebase_ddd_course/domain/notes/note_failure.dart';
import 'package:notes_firebase_ddd_course/injection.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/widgets/notes_overview_body_widget.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/widgets/uncompleted_switch.dart';

@RoutePage()
class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(
              const NoteWatcherEvent.watchAllStarted(),
            ),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () => {},
                unauthenticated: () =>
                    AutoRouter.of(context).replaceNamed('/sign-in-page'),
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                deleteFailure: (NoteFailure failure) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: failure.when(
                      unexpected: () =>
                          "Unexepcted error occured while deleting, please contact suport",
                      insufficientPersmission: () => "Insuficient Permission ❌",
                      unableToUpdate: () => "Impossible error",
                    ),
                  ).show(context);
                },
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Notes"),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(
                  const AuthEvent.signedOut(),
                );
              },
            ),
            actions: const [UncompletedSwitch()],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: Navigate to NoteFormPage
            },
            child: const Icon(Icons.add),
          ),
          body: const NotesOverviewBody(),
        ),
      ),
    );
  }
}
