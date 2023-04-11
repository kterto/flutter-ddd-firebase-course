// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:dartz/dartz.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:notes_firebase_ddd_course/domain/notes/note.dart' as _i8;
import 'package:notes_firebase_ddd_course/presentation/notes/note_form/note_form_page.dart'
    as _i4;
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/notes_overview_page.dart'
    as _i3;
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart'
    as _i2;
import 'package:notes_firebase_ddd_course/presentation/splash/splash_page.dart'
    as _i1;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    NotesOverviewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NotesOverviewPage(),
      );
    },
    NoteFormRoute.name: (routeData) {
      final args = routeData.argsAs<NoteFormRouteArgs>(
          orElse: () => const NoteFormRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NoteFormPage(
          key: args.key,
          editedNote: args.editedNote,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.NotesOverviewPage]
class NotesOverviewRoute extends _i6.PageRouteInfo<void> {
  const NotesOverviewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NotesOverviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesOverviewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NoteFormPage]
class NoteFormRoute extends _i6.PageRouteInfo<NoteFormRouteArgs> {
  NoteFormRoute({
    _i7.Key? key,
    _i5.Option<_i8.Note> editedNote = const _i5.None(),
    List<_i6.PageRouteInfo>? children,
  }) : super(
          NoteFormRoute.name,
          args: NoteFormRouteArgs(
            key: key,
            editedNote: editedNote,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteFormRoute';

  static const _i6.PageInfo<NoteFormRouteArgs> page =
      _i6.PageInfo<NoteFormRouteArgs>(name);
}

class NoteFormRouteArgs {
  const NoteFormRouteArgs({
    this.key,
    this.editedNote = const _i5.None(),
  });

  final _i7.Key? key;

  final _i5.Option<_i8.Note> editedNote;

  @override
  String toString() {
    return 'NoteFormRouteArgs{key: $key, editedNote: $editedNote}';
  }
}
