import 'package:auto_route/auto_route.dart';
import 'package:notes_firebase_ddd_course/presentation/notes/note_overview/notes_overview_page.dart';
import 'package:notes_firebase_ddd_course/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_ddd_course/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      page: SignInPage,
    ),
    AutoRoute(
      page: NotesOverviewPage,
    ),
  ],
)
class $AppRouter {}
